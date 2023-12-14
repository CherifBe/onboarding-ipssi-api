const router = require('express').Router();
const bcrypt = require('bcrypt');
const db = require('../database/db');

router.post('/', async (req, res, next) => {
    try {
        id, name, email, hash, created_at, updated_at

        const { name, email, password } = req.body;
        
        if(!name || !email || !password){
            res.status(400).json({ message: 'Bad credentials' });
        }

        const regCheckName = new RegExp('^[a-z_-]{3,15}$');
        const regCheckEmail = new RegExp('[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+');
        const regCheckPassword = new RegExp('^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$');

        if(!regCheckName.test(name) || 
        !regCheckEmail.test(email) || 
        !regCheckPassword.text(password)){
            res.status(200).json({ message: 'Bad credentials' });
        }
        
        const saltRounds = 10;
        const hash = await bcrypt.hash(password, saltRounds);

        const userAlreadyExist = "SELECT * FROM Users WHERE email=?";
        db.query(userAlreadyExist, [email], (err, results) => {
            if(results){
                res.status(400).json({ message:  'Cet email est déjà utilisé'});
            }
        });
    
        const insertUserQuery = "INSERT INTO Users(name, email, hash) VALUES(?, ?, ?)";
    
        db.query(insertUserQuery, [name, email, hash], (err, results) => {
            if (err) {
                console.log('Erreur lors de l\'ajout d\'un utilisateur');
                res.status(500).json({ message : err })
            } else {
                res.status(200).json(results);
            }
        });
    } catch (error) {
        next(error);
    }
});

router.post('/login', async (req, res, next) => {
    if (!('email' in req.body && 'password' in req.body)) {
        return res
            .status(422)
            .json({ message: 'need 2 keys : email, password' });
    }
    const { email, password } = req.body;
    const getUserQuery = 'SELECT * FROM Users WHERE email=?';

    db.query(getUserQuery, [email], async (err, results) => {
        if (!results) {
            res.status(409).json({ message: 'wrong email or password' });
        } else {
            console.log(results);
            const isValid = await bcrypt.compare(password, results.hash);
            if (!isValid) {
                res.status(409).json({ message: 'wrong email or password' });
            }
            res.status(200).json(results);
        }
    })
});

router.delete(
    '/:userId',
    async (req, res, next) => {
        try {
            const userId = req.params.userId;
            const sql = "DELETE FROM Users WHERE id=?";
            db.query(sql, [userId], (err, results) => {
                if (err) {
                    console.log('Erreur lors de la suppression de user');
                    res.status(500).json({ message : err })
                } else {
                    res.status(200).json({ message: 'Le user est bien supprimé.' });
                }
            }
            )
        } catch (error) {
            next(error);
        }
    }
);

module.exports = router;