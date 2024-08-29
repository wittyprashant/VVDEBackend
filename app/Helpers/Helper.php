<?php

namespace App\Helpers;

use App\Constant;
use Illuminate\Http\Response;


if(!function_exists('apiSuccessResponse')) {
    function apiSuccessResponse($data, $message = '') {
        $response = array(
            'message' => $message,
            'success' => Constant::API_SUCCESS,
            'result' => $data,
            'status' => Response::HTTP_OK
        );
        return $response;
    }
}

if(!function_exists('apiErrorResponse')) {
    function apiErrorResponse($message ='', $data = []) {
        $response = array(
            'message' => $message,
            'success'=> Constant::API_ERROR,
            'result'=> $data,
            'status' => Response::HTTP_BAD_REQUEST
        );
        return $response;
    }
}
