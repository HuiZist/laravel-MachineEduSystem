<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ExamineController extends Controller
{
    public function show()
    {
        return view('examine.show');
    }
}
