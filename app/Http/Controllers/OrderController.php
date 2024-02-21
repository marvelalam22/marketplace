<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\User;
use App\Models\Category;
use App\Models\Order;
use DateTime;
use DateTimeZone;
use Symfony\Component\VarDumper\VarDumper;

class OrderController extends Controller
{
    public function create(Post $post)
    {
        return view('orders.create', [
            'posts' => Post::all(),
            'users' => User::all(),
            'title' => 'Payment',
            'active' => 'payment',
            "post" => $post,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        $validatedData = $request->validate([
            'name' => 'required|max:255',
            'email' => 'required|email:dns|unique:users',
            'telepon' => 'required|max:16',
            'rekening' => 'required|max:32',
            'no_rekening' => 'required|max:30',
        ]);
        
        if (auth()->check()) {
        $validatedData['user_id'] = auth()->user()->id;
        }
        $validatedData['post_id'] = $request->post_id;
        $validatedData['price'] = $request->price;

        $batas_waktu_order = new DateTime('now', new DateTimeZone('Asia/Jakarta'));
        $batas_waktu_order->modify('+15 minutes');
        $batas_waktu_ordernya = $batas_waktu_order->format('Y-m-d H:i:s');
        $validatedData['batas_waktu_order'] = $batas_waktu_order;

        $post = Post::findOrFail($request->post_id);

        Order::create($validatedData);

         return view('orders.waiting',[
            'title' => 'Waiting',
            'active' => 'waiting',
            'batas_waktu_order' => $batas_waktu_ordernya,
            'post' => $post,
            'price' => $request->price,
        ]);
    }
}
