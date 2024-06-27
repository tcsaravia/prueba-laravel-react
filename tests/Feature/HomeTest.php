<?php

namespace Tests\Feature;

use App\Models\Post;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class HomeTest extends TestCase
{
    use RefreshDatabase;

    public function test_la_página_de_inicio_muestra_publicaciones()
    {
        
        $posts = Post::factory()->count(5)->create();

        $response = $this->get('/');

        $response->assertStatus(200);
        foreach ($posts as $post) {
            $response->assertSee($post->title);
            $response->assertSee($post->content);
        }
    }

    public function test_paginación_de_la_página_de_inicio()
    {
        
        $posts = Post::factory()->count(15)->create();

        $response = $this->get('/');

        $response->assertStatus(200);

        
        foreach ($posts->take(10) as $post) {
            $response->assertSee($post->title);
            $response->assertSee($post->content);
        }

        
        $response->assertSee('Next');
        $response->assertSee('Previous');

       
        foreach ($posts->slice(10, 5) as $post) {
            $response->assertDontSee($post->title);
            $response->assertDontSee($post->content);
        }

        
        $response = $this->get('/?page=2');
        $response->assertStatus(200);

        foreach ($posts->slice(10, 5) as $post) {
            $response->assertSee($post->title);
            $response->assertSee($post->content);
        }
    }

    public function test_la_página_de_inicio_contiene_encabezado()
    {
        $response = $this->get('/');
        
        $response->assertStatus(200);
        $response->assertSee('Home Page');
    }

    public function test_Los_enlaces_de_la_página_de_inicio_funcionan_correctamente()
    {
        $response = $this->get('/');
        
        $response->assertStatus(200);
        
       
        $response->assertSee('<a href="http://localhost?page=1">1</a>', false);
        $response->assertSee('<a href="http://localhost?page=2">2</a>', false);
    }

    public function test_la_página_de_inicio_contiene_pie_de_página()
    {
       
        $response = $this->get('/');
        
        $response->assertStatus(200);
        $response->assertSee('Footer content');
    }
}
