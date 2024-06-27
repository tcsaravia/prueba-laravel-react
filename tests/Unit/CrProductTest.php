<?php

namespace Tests\Unit;

use App\Models\CreateProduct;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class CreateProductTest extends TestCase
{
    use RefreshDatabase;

    /**
     
     *
     * @return void
     */
    public function test_crear_producto()
    {
       
        $attributes = [
            'name' => 'Sample Product',
            'price' => 99.99,
            'description' => 'This is a sample product description.',
        ];

        
        $product = Product::create($attributes);

       
        $this->assertDatabaseHas('products', $attributes);
        $this->assertInstanceOf(Product::class, $product);
        $this->assertEquals('Sample Product', $product->name);
        $this->assertEquals(99.99, $product->price);
        $this->assertEquals('This is a sample product description.', $product->description);
    }
}
