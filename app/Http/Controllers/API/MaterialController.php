<?php

namespace App\Http\Controllers\API;

use Validator;
use App\Models\Material;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use function App\Helpers\apiSuccessResponse;
use function App\Helpers\apiErrorResponse;

class MaterialController extends Controller
{
    public function addMaterial(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'image' => 'required',
        ]);

        if($validation->fails()) {
            return response()->json(['error' => $validation->errors()], 422);
        }

        $isExists = Material::where('name', $request->name)->exists();

        if($isExists == true) {
            return apiErrorResponse('Material already exists');
        } else {
            $material = new Material();
            $material->name = $request->input('name');

            if($request->hasfile('image'))
            {
                $file = $request->file('image');
                $extenstion = $file->getClientOriginalExtension();
                $filename = time().'.'.$extenstion;
                $file->move('uploads/materials/', $filename);
                $material->image = $filename;
            }
            $material->save();

            if($material) {
                return apiSuccessResponse($material, 'Material added successfully.');
            } else {
                return apiErrorResponse('Something went to wrong.');
            }
        }
    }

    public function editMaterial(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
        ]);

        if($validation->fails()) {
            return response()->json(['error' => $validation->errors()], 422);
        }

        $material = Material::where('id', $request->id)->update(['name' => $request->name]);

        return apiSuccessResponse($material, 'Material updated successfully.');
    }

    public function deleteMaterial(Request $request)
    {
        $material = Material::where('id', $request->id)->update(['is_deleted' => 1]);

        return apiSuccessResponse($material, 'Material deleted successfully.');
    }

    public function getAllMaterial()
    {
        $materials = Material::get();

        return apiSuccessResponse($materials, 'Get all materials successfully.');
    }
}
