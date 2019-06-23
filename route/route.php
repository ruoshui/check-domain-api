<?php

Route::get('login',		'admin/account/login');
Route::get('reg',		'admin/account/reg');
Route::get('welcome',	'admin/index/index');

/* 域名检测 */
Route::get('checkdomain',	'item/auto/checkDomain');

/* 跳转 短链接 */
Route::get('u/:id',	'item/jump/show')->pattern(['id' => '\d+']);


/* 视频 */
Route::get('video/:id/:t',	'item/video/show')->pattern(['id' => '\d+', 't' => '\d+']);
Route::get('video/:id',		'item/video/show')->pattern(['id' => '\d+']);
Route::get('video',			'item/video/show');


/* 广告 */
Route::get('ad/:id/:t',	'item/ad/index')->pattern(['id' => '\d+', 't' => '\d+']);
Route::get('ad/:id',	'item/ad/index')->pattern(['id' => '\d+']);
Route::get('ad',		'item/ad/index');







return [

];
