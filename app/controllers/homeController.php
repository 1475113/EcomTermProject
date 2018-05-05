<?php
class HomeController extends Controller
{
	/**
	 * The default Controller method
	 *
	 * @return void
	 */
	 public function index($name = '')
	 {
		 $user = $this->model('Login');
		 $user->name = $name;
		 
		 $this->view('home/index', ['name' => $user->name]);
	 }
	 /*
	 public function index($name = 'jethro', $mood = 'happy')
	 {
		 $user = $this->model('user');
		 $user->name = $name;
		 
		 $this->view('home/index', [
			'name' => $user->name,
			'mood' => $mood
		 ]);
	 }
	 */
	 public function test($name = '', $otherName = '')
	 {
		 echo $name . ' ' . $otherName;
	 }
}