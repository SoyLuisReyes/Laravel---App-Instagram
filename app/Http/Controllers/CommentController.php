<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Comment;

class CommentController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function save(Request $request){

        //validacion
        $validate = $this->validate($request, [
            'image_id' => 'integer|required',
            'content' => 'string|required'
        ]);

        // Recoger datos
        $user = \Auth::user();
        $image_id = $request->input('image_id');
        $content = $request->input('content');

        //Asigo los valores a mi nuevo objeto a guardar
        $comment = new Comment();
        $comment->user_id = $user->id;
        $comment->image_id = $image_id;
        $comment->content = $content;

        //Guardar en la base de datos
        $comment->save();

        //Redireccion
        return redirect()->route('image.detail', ['id' => $image_id])
                         ->with([
                            'message' => 'Has publicado tu comentario correctamente! :)'
                         ]);
    }

    public function delete($id){
        // Conseguir datos del usuario loguead
        $user = \Auth::user();

        //conseguir objetos del comentario
        $comment = Comment::find($id);

        //Comprobar si soy el dueño del comentario o de la publicacion
        if($user && ($comment->user_id == $user->id || $comment->image->user_id == $user->id) ){
            $comment->delete();

            return redirect()->route('image.detail', ['id' => $comment->image->id])
            ->with([
               'message' => 'Comentario Eliminado correctamente! :)'
            ]);
        }else{
            return redirect()->route('image.detail', ['id' => $comment->image->id])
            ->with([
               'message' => 'El Comentario no se ha liminado correctamente! :)'
            ]);
        }
    }
}
