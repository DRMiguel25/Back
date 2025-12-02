const bcrypt = require('bcrypt');

// Tu contraseña solicitada
const password = 'omandas_password_2025';
const saltRounds = 10;

bcrypt.hash(password, saltRounds, function(err, hash) {
    if (err) {
        console.error(err);
        return;
    }
    console.log('\n  COPIA Y PEGA TODO ESTO EN MYSQL: ');
    console.log('------------------------------------------');
    console.log('USE comandas_db;');
    // Actualizamos a los 3 usuarios de un solo golpe
    console.log(`UPDATE users SET password = '${hash}' WHERE name IN ('admin', 'chef1', 'mesero1');`);
    console.log('------------------------------------------\n');
});
