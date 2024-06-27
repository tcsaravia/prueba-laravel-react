<?php

namespace Tests\Feature;

use App\Models\Product;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ProductTest extends TestCase
{
    use RefreshDatabase;

    public function test_índice_muestra_productos()
    {
        $products = Product::factory()->count(3)->create();

        $response = $this->get(route('products.index'));

        $response->assertStatus(200);

        foreach ($products as $product) {
            $response->assertSee($product->name);
            $response->assertSee($product->description);
            $response->assertSee((string) $product->price);
            $response->assertSee((string) $product->quantity);
        }
    }

    public function test_almacenar_producto()
    {
        $productData = [
            'name' => 'Test Product',
            'description' => 'Test Description',
            'price' => 99.99,
            'quantity' => 10,
        ];

        $response = $this->post(route('products.store'), $productData);

        $response->assertRedirect(route('products.index'));
        $this->assertDatabaseHas('products', $productData);
    }

    public function test_actualizar_producto()
    {
        $product = Product::factory()->create();

        $updatedData = [
            'name' => 'Updated Product',
            'description' => 'Updated Description',
            'price' => 199.99,
            'quantity' => 20,
        ];

        $response = $this->put(route('products.update', $product->id), $updatedData);

        $response->assertRedirect(route('products.index'));
        $this->assertDatabaseHas('products', $updatedData);
        $this->assertDatabaseMissing('products', $product->toArray());
    }

}
