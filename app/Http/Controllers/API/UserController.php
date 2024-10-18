<?php

namespace App\Http\Controllers\API;

use DB;
use Validator;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use App\Models\ContributorMeta;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use function App\Helpers\apiSuccessResponse;
use function App\Helpers\apiErrorResponse;

class UserController extends Controller
{
    public function login(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'email' => 'required|string|max:255',
            'password' => 'required|min:6',
        ]);

        if($validation->fails()) {
            return response()->json(['error' => $validation->errors()], 422);
        }

        $user = User::where('email', $request['email'])
            ->where('password', md5($request['password']))
            ->first();

        if ($user) {
            $token = $user->createToken('Token Name')->accessToken;

            $result = $user;
            $result['token'] = $token;
            $result['memberId'] = $user['id'];
            $result['roleId'] = $user['role_id'];

            return apiSuccessResponse($result, 'Login successfully.');
        } else {
            return apiErrorResponse('Invalid credentials');
        }
    }

    public function register(Request $request)
    {
        $name = $request->name;
        $role = $request->role;
        $email = $request->email;
        $password = $request->password;
        $confirm_password = $request->confirm_password;

        if(!isset($name) || !isset($email) || !isset($password) || !isset($role)) {
            return apiErrorResponse('Invalid request');
        }

       $isExists = User::where('email', $email)->exists();
       if($isExists == true) {
            return apiErrorResponse('Email already exists.');
       } elseif (strcmp($password, $confirm_password) != 0) {
           return apiErrorResponse('Password and confirm password doesn\'t match.');
       } else {
            $userDetail = [];
            $user = User::create([
                'name' => $name,
                'role_id' => $role,
                'email' => $email,
                'password' => md5($password),
            ]);

            $token = $user->createToken('Token Name')->accessToken;

            $result = $user;
            $result['token'] = $token;
            $result['memberId'] = $user['id'];
            $result['roleId'] = $user['role_id'];

            return apiSuccessResponse($result, 'Registration successfully.');
       }
    }

    public function contributorLogin(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'email' => 'required|string|max:255',
            'password' => 'required|min:6',
        ]);

        if($validation->fails())
        {
            return response()->json(['error' => $validation->errors()], 422);
        }

        $user = User::where('email', $request['email'])
            ->where('password', md5($request['password']))
            ->where('role_id', 2)
            ->first();

        if ($user) {
            $token = $user->createToken('Token Name')->accessToken;

            $result = $user;
            $result['token'] = $token;
            $result['memberId'] = $user['id'];
            $result['roleId'] = $user['role_id'];

            return apiSuccessResponse($result, 'Login successfully.');
        } else {
            return apiErrorResponse('Invalid credentials or User not found.');
        }
    }

    public function userLogin(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'email' => 'required|string|max:255',
            'password' => 'required|min:6',
        ]);

        if($validation->fails()) {
            return response()->json(['error' => $validation->errors()], 422);
        }

        $user = User::where('email', $request['email'])
            ->where('password', md5($request['password']))
            ->where('role_id', 3)
            ->first();

        if ($user) {
            $token = $user->createToken('Token Name')->accessToken;

            $result = $user;
            $result['token'] = $token;
            $result['memberId'] = $user['id'];
            $result['roleId'] = $user['role_id'];

            return apiSuccessResponse($result, 'Login successfully.');
        } else {
            return apiErrorResponse('Invalid credentials or User not found.');
        }
    }

    public function contributorRegister(Request $request)
    {
        $rules = [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email',
            'password' => 'required|string|min:6',
        ];

        $messages = [
            'email.unique' => 'Email already exists.',
        ];

        $validator = Validator::make($request->all(), $rules, $messages);

        if ($validator->fails()) {
            return apiErrorResponse($validator->errors()->first());
        }

        $user = User::create([
            'name' => $request->name,
            'role_id' => 2, // Set role to contributor
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        // Create contributor meta
        $contributor = ContributorMeta::create([
            'name' => $request->name,
            'category_id' => $request->category_id,
            'affiliation' => $request->affiliation,
            'email' => $request->email,
            'publication_reviewed' => $request->publication_reviewed,
            'corresponding_author' => $request->corresponding_author,
            'publication_title' => $request->publication_title,
            'publication_weblink' => $request->publication_weblink,
        ]);

        if ($user && $contributor) {
            $token = $user->createToken('Token Name')->accessToken;

            $result = $user;
            $result['token'] = $token;
            $result['memberId'] = $user['id'];
            $result['roleId'] = $user['role_id'];

            return apiSuccessResponse($result, 'Registration successful.');
        } else {
            return apiErrorResponse('Something went wrong!');
        }
    }

    // public function contributorRegister(Request $request)
    // {
    //     $name = $request->name;
    //     $role = 2;
    //     $email = $request->email;
    //     $password = $request->password;
    //     $confirm_password = $request->confirm_password;

    //     if(!isset($name) || !isset($email) || !isset($password)) {
    //         return apiErrorResponse('Invalid request');
    //     }

    //     $isExists = User::where('email', $email)->where('role_id', 2)->exists();

    //     if($isExists == true) {
    //         return apiErrorResponse('Email already exists.');
    //     } elseif (strcmp($password, $confirm_password) != 0) {
    //         return apiErrorResponse('Password and confirm password doesn\'t match.');
    //     } else {
    //         $user = User::create([
    //             'name' => $name,
    //             'role_id' => $role,
    //             'email' => $email,
    //             'password' => md5($password),
    //         ]);
    //         $contributor = ContributorMeta::create([
    //             'name' => $request->name,
    //             'category_id' => $request->category_id,
    //             'affiliation' => $request->affiliation,
    //             'email' => $request->email,
    //             'publication_reviewed' => $request->publication_reviewed,
    //             'corresponding_author' => $request->corresponding_author,
    //             'publication_title' => $request->publication_title,
    //             'publication_weblink' => $request->publication_weblink,
    //         ]);

    //         if($user && $contributor) {
    //             $token = $user->createToken('Token Name')->accessToken;

    //             $result = $user;
    //             $result['token'] = $token;
    //             $result['memberId'] = $user['id'];
    //             $result['roleId'] = $user['role_id'];

    //             return apiSuccessResponse($result, 'Registration successfully.');
    //         } else {
    //             return apiErrorResponse('Something went to wrong!');
    //         }
    //    }
    // }

    public function userRegister(Request $request)
    {
        // Define validation rules
        $rules = [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email',
            'password' => 'required|string|min:6',
        ];

        // Define custom error messages (optional)
        $messages = [
            'email.unique' => 'Email already exists.',
            // 'password.confirmed' => 'Password and confirm password don\'t match.',
        ];

        // Perform validation
        $validator = Validator::make($request->all(), $rules, $messages);

        // Check if validation fails
        if ($validator->fails()) {
            return apiErrorResponse($validator->errors()->first());
        }

        // Create user
        $user = User::create([
            'name' => $request->name,
            'role_id' => $request->role,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        // Generate token
        $token = $user->createToken('Token Name')->accessToken;

        $result = $user;
        $result['token'] = $token;
        $result['memberId'] = $user['id'];
        $result['roleId'] = $user['role_id'];

        return apiSuccessResponse($result, 'Registration successful.');
    }

    // public function userRegister(Request $request)
    // {
    //     $name = $request->name;
    //     $role = 3;
    //     $email = $request->email;
    //     $password = $request->password;
    //     $confirm_password = $request->confirm_password;

    //     if(!isset($name) || !isset($email) || !isset($password)) {
    //         return apiErrorResponse('Invalid request');
    //     }

    //    $isExists = User::where('email', $email)->where('role_id', 3)->exists();
    //    if($isExists == true) {
    //         return apiErrorResponse('Email already exists.');
    //    } elseif (strcmp($password, $confirm_password) != 0) {
    //        return apiErrorResponse('Password and confirm password doesn\'t match.');
    //    } else {
    //         $user = User::create([
    //             'name' => $name,
    //             'role_id' => $role,
    //             'email' => $email,
    //             'password' => md5($password),
    //         ]);

    //         $token = $user->createToken('Token Name')->accessToken;

    //         $result = $user;
    //         $result['token'] = $token;
    //         $result['memberId'] = $user['id'];
    //         $result['roleId'] = $user['role_id'];

    //         return apiSuccessResponse($result, 'Registration successfully.');
    //    }
    // }

    public function userDetails($id)
    {
        $user = User::select(
            'users.id as id',
            'roles.role_name as role_name',
            'users.name as name',
            'users.email as email',
            'users.created_at'
        )
        ->join('roles', 'users.role_id', '=', 'roles.id')
        ->where('users.id', $id)
        ->get();

        if($user) {
            return apiSuccessResponse($user, 'Get user details successfully.');
        } else {
            return apiErrorResponse('Something went to wrong!');
        }
    }

    public function getAllUser()
    {
        $users = User::select(
            'users.id as id',
            'roles.role_name as role_name',
            'users.name as name',
            'users.email as email',
            'users.created_at'
        )
        ->join('roles', 'users.role_id', '=', 'roles.id')
        ->get();

        return apiSuccessResponse($users, 'Get all users successfully.');
    }

    // public function deleteUser(Request $request) {
    //     try {
    //         $user = User::findOrFail($request->id);
    //         $user->delete();
    //         return response()->json([
    //             'status' => 200,
    //             'success' => true,
    //             'message' => 'User deleted successfully.',
    //         ]);
    //     } catch (\Exception $e) {
    //         return response()->json([
    //             'status' => 200,
    //             'success' => false,
    //             'message' => 'User not found or deletion failed!',
    //             'error' => $e->getMessage(),
    //         ], 200);
    //     }
    // }

    public function deleteUser($id) {
        try {
            $user = User::findOrFail($id);
            $user->delete();
            return response()->json([
                'status' => 200,
                'success' => true,
                'message' => 'User deleted successfully.',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 400,
                'success' => false,
                'message' => 'User not found or deletion failed!',
                'error' => $e->getMessage(),
            ], 400);
        }
    }
}
