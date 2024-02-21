<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Post;
use App\Models\User;
use App\Models\Category;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        User::create([
            'name' => 'admin',
            'username' => 'admin',
            'email' => 'admin@gmail.com',
            'password' => bcrypt('admin')
        ]);

        User::create([
            'name' => 'user1',
            'username' => 'user1',
            'email' => 'user1@gmail.com',
            'password' => bcrypt('user1')
        ]);

        User::create([
            'name' => 'user2',
            'username' => 'user2',
            'email' => 'user2@gmail.com',
            'password' => bcrypt('user2')
        ]);

        User::create([
            'name' => 'user3',
            'username' => 'user3',
            'email' => 'user3@gmail.com',
            'password' => bcrypt('user3')
        ]);

        Category::create([
            'name' => 'Clothes',
            'slug' => 'clothes',
        ]);

        Category::create([
            'name' => 'Jeans',
            'slug' => 'jeans',
        ]);

        Category::create([
            'name' => 'Shoes',
            'slug' => 'shoes',
        ]);

        Post::factory(18)->create();
    }
}
