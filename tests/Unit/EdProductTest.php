<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Product;
use Illuminate\Foundation\Testing\RefreshDatabase;

class ProductTest extends TestCase
{
    use RefreshDatabase;


    /**
     *
     * @return void
     */
    public function test_editar_producto()
    {
        
        $product = Product::create([
            'name' => 'Original Product',
            'price' => 50.00,
            'description' => 'Original description.',
        ]);

        
        $updatedAttributes = [
            'name' => 'Updated Product',
            'price' => 75.00,
            'description' => 'Updated description.',
        ];

       
        $product->update($updatedAttributes);

       
        $this->assertDatabaseHas('products', $updatedAttributes);
        $this->assertEquals('Updated Product', $product->name);
        $this->assertEquals(75.00, $product->price);
        $this->assertEquals('Updated description.', $product->description);
    }
}
