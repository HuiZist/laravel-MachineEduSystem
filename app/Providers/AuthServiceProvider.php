<?php

namespace App\Providers;

use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;


class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        \App\User::class => \App\Policies\UserPolicy::class,
        \App\Lesson::class => \App\Policies\LessonPolicy::class,
        \App\LessonsSort::class => \App\Policies\LessonsSortPolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        //查看成员
        Gate::define('memberShow', function ($user) {
            return $user->is_admin === 2;
        });
    }
}
