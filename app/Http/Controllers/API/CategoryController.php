<?php

namespace App\Http\Controllers\API;

use Validator;
use App\Models\Category;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Dotenv\Validator as DotenvValidator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use function App\Helpers\apiSuccessResponse;
use function App\Helpers\apiErrorResponse;

class CategoryController extends Controller
{
    public function addCategory(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
        ]);

        if($validation->fails()) {
            return response()->json(['error' => $validation->errors()], 422);
        }

        $isExists = Category::where('name', $request->name)->exists();

        if($isExists == true) {
            return apiErrorResponse('Category already exists');
        } else {
            $category = Category::create([
                'name' => $request->name,
                'parent_id' => $request->parent_id,
                'display_order' => $request->display_order,
            ]);
            return apiSuccessResponse($category, 'Category added successfully.');
        }
    }

    public function editCategory(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
        ]);

        if($validation->fails()) {
            return response()->json(['error' => $validation->errors()], 422);
        }

        $category = Category::where('id', $request->id)->update([
            'name' => $request->name,
            'display_order' => $request->display_order,
            'parent_id' => $request->parent_id
        ]);

        return apiSuccessResponse($category, 'Category updated successfully.');
    }

    public function deleteCategory(Request $request)
    {
        $category = Category::where('id', $request->id)->update(['is_deleted' => 1]);

        return apiSuccessResponse($category, 'Category deleted successfully.');
    }

    public function getAllCategory()
    {
        $materials = Category::get();

        return apiSuccessResponse($materials, 'Get all category successfully.');
    }
}
