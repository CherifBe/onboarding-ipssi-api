const isAdmin = async (req, res, next) => {
    try {
        const sql = "SELECT * FROM User WHERE id=?";
        db.query(sql, [req.user.userId], (err, results) => {
            if (results.length === 0) {
                return res.status(401).json({ message: 'user not found' });
            } 
            if (results[0].role !== 'ADMIN'){
                return res.status(401).json({
                    message: 'You are not authorized to access this page',
                });
            }
        });

        next();
    } catch (error) {
        next(error);
    }
};

module.exports = isAdmin;