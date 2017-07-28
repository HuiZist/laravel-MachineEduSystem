<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLessonsSortsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lessons_sorts', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('thumbnail');
            $table->text('abstract');
            $table->integer('type')->default(0);
            $table->integer('user_id')->unsigned();
            $table->integer('lessons_count')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('lessons_sorts');
    }
}
