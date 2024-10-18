<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['middleware' => ['cors']], function () {
    Route::post('logout', 'App\Http\Controllers\API\UserController@logout');

    // Materials module

    Route::post('add/material', 'App\Http\Controllers\API\MaterialController@addMaterial')->name('add.material');
    Route::post('edit/material', 'App\Http\Controllers\API\MaterialController@editMaterial')->name('edit.material');
    Route::post('delete/material', 'App\Http\Controllers\API\MaterialController@deleteMaterial')->name('delete.material');

    // Categories module
    Route::post('add/category', 'App\Http\Controllers\API\CategoryController@addCategory')->name('add.category');
    Route::post('edit/category', 'App\Http\Controllers\API\CategoryController@editCategory')->name('edit.category');
    Route::post('delete/category', 'App\Http\Controllers\API\CategoryController@deleteCategory')->name('delete.category');

    // Contributor Meta
    Route::post('add/contributor_meta', 'App\Http\Controllers\API\ContributorMetaController@addContributorMeta')->name('add.contributor_meta');

    //Dataset meta form data
    Route::post('add/dataset_meta', 'App\Http\Controllers\API\DatasetMetaController@addDatasetMeta')->name('add.dataset_meta');
});

Route::post('login','App\Http\Controllers\API\UserController@login')->name('login');

Route::post('contributor/login','App\Http\Controllers\API\UserController@contributorLogin')->name('contributor.login');
Route::post('user/login','App\Http\Controllers\API\UserController@userLogin')->name('user.login');

Route::post('contributor/register','App\Http\Controllers\API\UserController@contributorRegister')->name('contributor.register');
Route::post('user/register','App\Http\Controllers\API\UserController@userRegister')->name('user.register');
Route::get('user/details/{id}','App\Http\Controllers\API\UserController@userDetails')->name('user.details');

Route::post('register','App\Http\Controllers\API\UserController@register')->name('register');

Route::get('materials', 'App\Http\Controllers\API\MaterialController@getAllMaterial')->name('materials');

Route::get('users', 'App\Http\Controllers\API\UserController@getAllUser')->name('users');
Route::post('user/delete/{id}', 'App\Http\Controllers\API\UserController@deleteUser')->name('user.delete');

Route::get('categories', 'App\Http\Controllers\API\CategoryController@getAllCategory')->name('categories');
