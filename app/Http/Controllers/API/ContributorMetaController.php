<?php

namespace App\Http\Controllers\API;

use Validator;
use App\Models\ContributorMeta;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\FlareClient\Api;

use function App\Helpers\apiSuccessResponse;
use function App\Helpers\apiErrorResponse;

class ContributorMetaController extends Controller
{
    public function addContributorMeta(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'category_id' => 'required|string|max:255',
            'email' => 'required|string|max:255',
            'publication_reviewed' => 'required|string|max:255',
        ]);

        if($validation->fails()) {
            return response()->json(['error' => $validation->errors()], 422);
        }

        $isExists = ContributorMeta::where('name', $request->name)->exists();

        if($isExists == true) {
            return apiErrorResponse('Data already exists');
        } else {
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
            return apiSuccessResponse($contributor, 'ContributorMeta added successfully.');
        }
    }

    // public function editMaterial(Request $request)
    // {
    //     $validation = Validator::make($request->all(), [
    //         'name' => 'required|string|max:255',
    //     ]);

    //     if($validation->fails())
    //     {
    //         return response()->json(['error' => $validation->errors()], 422);
    //     }

    //     $material = Material::where('id', $request->id)->update(['name' => $request->name]);

    //     return apiSuccessResponse($material, 'Material updated successfully.');

    // }

    // public function deleteMaterial(Request $request)
    // {
    //     $material = Material::where('id', $request->id)->update(['is_deleted' => 1]);

    //     return apiSuccessResponse($material, 'Material deleted successfully.');

    // }
}
