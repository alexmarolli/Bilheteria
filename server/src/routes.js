const express = require('express');
const router = express.Router();
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const config = require('config');
const { check, validationResult } = require('express-validator');

router.post(
    '/singin', [
        check('email', 'Please include a valid email').isEmail(),
        check('password',
            ' '
        ).isLength({ min: 6 }),
    ],
    async(req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json({ errors: errors.array() });
        }

        const { email, password } = req.body;

        try {
            let user = await prisma.usuarios.findUnique({
                where: {
                    email: email,
                }
            });

            if (!user) {
                return res
                    .status(400)
                    .json({ errors: [{ msg: 'Invalid Credentials' }] });
            }

            const isMatch = await bcrypt.compare(password, user.password);

            if (!isMatch) {
                return res
                    .status(400)
                    .json({ errors: [{ msg: 'Invalid Credentials' }] });
            }

            const payload = {
                user: {
                    id: user.id,
                },
            };

            jwt.sign(
                payload,
                config.get('jwtSecret'), { expiresIn: 360000 },
                (err, token) => {
                    if (err) throw err;
                    res.json({ token });
                }
            );
        } catch (err) {
            console.error(err.message);
            res.status(500).send('Server error');
        }
    }
);

router.post(
    '/create', [
        check('email', 'Please include a valid email').isEmail(),
        check(
            'password',
            'Please enter a password with 6 or more characters'
        ).isLength({ min: 6 }),
    ],
    async(req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json({ errors: errors.array() });
        }

        const { email, password } = req.body;

        try {
            let user = await prisma.user.findOne({
                where: {
                    email: email,
                }
            });

            if (user) {
                return res.status(400).json({ errors: [{ msg: 'User already exists' }] });
            }

            const salt = await bcrypt.genSalt(10);

            const hashedPassword = await bcrypt.hash(password, salt);

            const newUser = await prisma.usuarios.create({
                data: {
                    email: email,
                    password: hashedPassword
                }
            });

            res.json(newUser);

        } catch (err) {
            console.error(err.message);
            res.status(500).send('Server error');
        }
    }
);

router.post('./venda', () => ({

}));


module.exports = router;