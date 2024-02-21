<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class IsAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        //pengecekan role bisa menggunakan middleware atau langsung pada tiap function di controllernya
        //cek rolenya, jika tamu atau bukan username alam munculkan forbidden 403
        // if(auth()->guest() || auth()->user()->username !== 'alam'){
        //     abort(403);
        // }

        //sama saja dengan if sebelumnya, bedanya ini dicek sudah login apa belum, karena mengembalikan nilai true jika sudah login, maka perlu dibalik dengan !
        // if (!auth()->check() || auth()->user()->username !== 'alam') {

        //kalau user belum login atau bukan admin, munculkan forbidden 403
        if (!auth()->check() || !auth()->user()->is_admin) {
            abort(403);
        }

        //masukkan atau daftarkan pada kernelnya dahulu sebelum digunakan
        return $next($request);
    }
}
