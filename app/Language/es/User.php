<?php

return [
    'email' => [
        'is_unique' => 'Ese correo electrónico ya está registrado'
    ],
    'password_confirmation' => [
        'required' => 'Por favor, repite la contraseña',
        'matches' => 'Por favor, ingrese la contraseña de nuevo'
    ]
];