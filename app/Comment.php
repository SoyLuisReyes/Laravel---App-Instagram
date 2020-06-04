<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    //
    // indicar la tabla a modificar
    protected $table = 'comments';

    //Relacion de Mucho a uno
    public function user(){
        return $this->belongsTo('App\User', 'user_id');
    }

    //Relacion de Mucho a uno
    public function image(){
        return $this->belongsTo('App\Image', 'image_id');
    }
}
