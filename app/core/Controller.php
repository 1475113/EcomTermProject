<?php

class Controller
{
	public function model($model){
		if(file_exists('app/models/' . $model . '.php')){
			require_once 'app/models/' . $model . '.php';
			return new $model();
		}else 
			return null;
	}

	protected function view($view, $data = []){
		if(file_exists('app/views/' . $view . '.php')){
			//not sure about _once here...
			require_once 'app/views/' . $view . '.php';
		}
		else
			echo "Can't load view $view: file not found!";
	}
}
?>