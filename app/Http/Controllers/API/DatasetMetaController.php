<?php

namespace App\Http\Controllers\API;

use Validator;
use App\Models\DatasetMeta;
use App\Models\DatasetMetaA1;
use App\Models\DatasetMetaA2;
use App\Models\DatasetMetaA3;
use App\Models\Material;
use App\Models\Category;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use function App\Helpers\apiSuccessResponse;
use function App\Helpers\apiErrorResponse;

class DatasetMetaController extends Controller
{
    public function addDatasetMeta(Request $request)
    {
        if(empty($request->input('material_id')) && empty($request->input('category_id')))
        {
            $material = new Material();
            $material->name = !empty($request->input('material_name')) ? $request->input('material_name') : '';
            if($request->hasfile('material_image'))
            {
                $file = $request->file('material_image');
                $extenstion = $file->getClientOriginalExtension();
                $filename = time().'.'.$extenstion;
                $file->move('uploads/materials/', $filename);
                $material->image = $filename;
            }
            $material->save();
            $last_insert_material_id = $material->id;

            $category = new Category();
            $category->name = !empty($request->input('category_name')) ? $request->input('category_name') : '';
            $category->image = 'no_image.png';
            // if($request->hasfile('material_image'))
            // {
            //     $file = $request->file('material_image');
            //     $extenstion = $file->getClientOriginalExtension();
            //     $filename = time().'.'.$extenstion;
            //     $file->move('uploads/categories/', $filename);
            //     $category->image = $filename;
            // }
            $category->save();
            $last_insert_category_id = $category->id;

            $datasetmeta = new DatasetMeta();
            $datasetmeta->material_id = $last_insert_material_id;
            $datasetmeta->category_id = $last_insert_category_id;
            $datasetmeta->manufacturer = !empty($request->input('manufacturer')) ? $request->input('manufacturer') : '';
            $datasetmeta->material_image = !empty($filename) ? $filename : '';
            $datasetmeta->data_type_id = !empty($request->input('data_type_id')) ? $request->input('data_type_id') : 1;
            $datasetmeta->data_reliability_id = !empty($request->input('data_reliability_id')) ? $request->input('data_reliability_id') : 1;
            $datasetmeta->data_source_id = !empty($request->input('data_source_name')) ? $request->input('data_source_name') : 1;
            $datasetmeta->process_review_id = !empty($request->input('process_review_id')) ? $request->input('process_review_id') : 1;
            $datasetmeta->beginning_year = !empty($request->input('beginning_year')) ? $request->input('beginning_year') : 0;
            $datasetmeta->beginning_month = !empty($request->input('beginning_month')) ? $request->input('beginning_month') : 0;
            $datasetmeta->ending_year = !empty($request->input('ending_year')) ? $request->input('ending_year') : 0;
            $datasetmeta->ending_month = !empty($request->input('ending_month')) ? $request->input('ending_month') : 0;
            // $datasetmeta->start_date = date("Y-m-d", strtotime($request->input('start_date')));
            // $datasetmeta->end_time = date("Y-m-d", strtotime($request->input('end_date')));
            $datasetmeta->save();
            $last_insert_datasetmeta_id = $datasetmeta->id;

            // A1 form data
            $formInputsArray = json_decode($request['formDataA1'], true);
            if(isset($formInputsArray) && !empty($formInputsArray))
            {
                foreach($formInputsArray as $keyF => $valueF)
                {
                    $datasetmetaa1 = new DatasetMetaA1();
                    $datasetmetaa1->cantributor_id = !empty($valueF->cantributor_id) ? (int)$valueF->cantributor_id : 0;
                    $datasetmetaa1->contributor_meta_id = !empty($valueF->contributor_meta_id) ? (int)$valueF->contributor_meta_id : 1;
                    $datasetmetaa1->dataset_meta_id = !empty($valueF->dataset_meta_id) ? (int)$valueF->dataset_meta_id : 1;
                    $datasetmetaa1->dataseta1_category_id = !empty($valueF->dataset_category_id) ? (int)$valueF->dataset_category_id : 1;
                    $datasetmetaa1->dataseta1_category_name = !empty($valueF->dataset_category_name) ? (int)$valueF->dataset_category_name : 1;

                    $datasetmetaa1->a1_raw_material = !empty($valueF->a1_raw_material) ? $valueF->a1_raw_material : '';
                    $datasetmetaa1->a1_raw_material_qty = !empty($valueF->a1_raw_material_qty) ? $valueF->a1_raw_material_qty : '';
                    $datasetmetaa1->a1_raw_material_extraction_status = !empty($valueF->a1_raw_material_extraction_status) ? $valueF->a1_raw_material_extraction_status : '';
                    $datasetmetaa1->a1_raw_material_extraction_process = !empty($valueF->a1_raw_material_extraction_process) ? $valueF->a1_raw_material_extraction_process : '';
                    $datasetmetaa1->a1_raw_material_extraction_site_lat = !empty($valueF->a1_raw_material_extraction_site_lat) ? $valueF->a1_raw_material_extraction_site_lat : '';
                    $datasetmetaa1->a1_raw_material_extraction_site_lon = !empty($valueF->a1_raw_material_extraction_site_lon) ? $valueF->a1_raw_material_extraction_site_lon : '';
                    $datasetmetaa1->a1_raw_material_extraction_site_district = !empty($valueF->a1_raw_material_extraction_site_district) ? $valueF->a1_raw_material_extraction_site_district : '';
                    $datasetmetaa1->a1_raw_material_extraction_site_state = !empty($valueF->a1_raw_material_extraction_site_state) ? $valueF->fuel_consume : '';
                    $datasetmetaa1->a1_fuel_mix = !empty($valueF->a1_fuel_mix) ? $valueF->a1_fuel_mix : '';
                    $datasetmetaa1->a1_fuel_qty = !empty($valueF->a1_fuel_qty) ? $valueF->a1_fuel_qty : '';
                    $datasetmetaa1->a1_fuel_density = !empty($valueF->a1_fuel_density) ? $valueF->a1_fuel_density : '';
                    $datasetmetaa1->a1_fuel_calorific_value = !empty($valueF->a1_fuel_calorific_value) ? $valueF->a1_fuel_calorific_value : '';
                    $datasetmetaa1->a1_embodied_energy_details = !empty($valueF->a1_embodied_energy_details) ? $valueF->a1_embodied_energy_details : '';
                    $datasetmetaa1->a1_characterization_factor = !empty($valueF->a1_characterization_factor) ? $valueF->a1_characterization_factor : '';
                    $datasetmetaa1->a1_embodied_energy_unit = !empty($valueF->a1_embodied_energy_unit) ? $valueF->a1_embodied_energy_unit : '';
                    $datasetmetaa1->save();
                }
            }

            // A2 form data
            $formInputsA2Array = json_decode($request['formDataA2'], true);
            if(isset($formInputsA2Array) && !empty($formInputsA2Array))
            {
                foreach($formInputsA2Array as $keyF => $valueF)
                {
                    $datasetmetaa2 = new DatasetMetaA2();
                    $datasetmetaa2->cantributor_id = !empty($valueF['cantributor_id']) ? (int)$valueF['cantributor_id'] : 1;
                    $datasetmetaa2->contributor_meta_id = !empty($valueF['contributor_meta_id']) ? (int)$valueF['contributor_meta_id'] : 1;
                    $datasetmetaa2->dataset_meta_id = !empty($valueF['dataset_meta_id']) ? (int)$valueF['dataset_meta_id'] : 1;
                    $datasetmetaa2->dataseta2_category_id  = !empty($valueF['dataseta2_category_id'] ) ? (int)$valueF['dataseta2_category_id']  : 1;
                    $datasetmetaa2->dataseta2_category_name = !empty($valueF['dataseta2_category_name']) ? (int)$valueF['dataseta2_category_name'] : 1;;

                    $datasetmetaa2->a2_raw_material = !empty($valueF['a2_raw_material']) ? $valueF['a2_raw_material'] : '';
                    $datasetmetaa2->a2_raw_material_manufacturing_plant = !empty($valueF['a2_raw_material_manufacturing_plant']) ? $valueF['a2_raw_material_manufacturing_plant'] : '';
                    $datasetmetaa2->a2_raw_material_extraction_site = !empty($valueF['a2_raw_material_extraction_site']) ? $valueF['a2_raw_material_extraction_site'] : '';
                    $datasetmetaa2->a2_raw_material_district = !empty($valueF['a2_raw_material_district']) ? $valueF['a2_raw_material_district'] : '';
                    $datasetmetaa2->a2_raw_material_state = !empty($valueF['a2_raw_material_state']) ? $valueF['a2_raw_material_state'] : '';
                    $datasetmetaa2->a2_raw_mat_distance_between_extraction_and_manufacturing_site = !empty($valueF['a2_raw_mat_distance_between_extraction_and_manufacturing_site']) ? $valueF['a2_raw_mat_distance_between_extraction_and_manufacturing_site'] : '';
                    $datasetmetaa2->a2_raw_material_vehicle_make = !empty($valueF['a2_raw_material_vehicle_make']) ? $valueF['a2_raw_material_vehicle_make'] : '';
                    $datasetmetaa2->a2_raw_material_vehicle_model = !empty($valueF['a2_raw_material_vehicle_model']) ? $valueF['a2_raw_material_vehicle_model'] : '';
                    $datasetmetaa2->a2_raw_material_vehicle_capacity = !empty($valueF['a2_raw_material_vehicle_capacity']) ? $valueF['a2_raw_material_vehicle_capacity'] : '';
                    $datasetmetaa2->a2_raw_material_vehicle_category = !empty($valueF['a2_raw_material_vehicle_category']) ? $valueF['a2_raw_material_vehicle_category'] : '';
                    $datasetmetaa2->a2_raw_material_trip_required_transporting_raw_material_qty = !empty($valueF['a2_raw_material_trip_required_transporting_raw_material_qty']) ? $valueF['a2_raw_material_trip_required_transporting_raw_material_qty'] : '';
                    $datasetmetaa2->a2_raw_material_total_distance_travel_transporting_raw_material = !empty($valueF['a2_raw_material_total_distance_travel_transporting_raw_material']) ? $valueF['a2_raw_material_total_distance_travel_transporting_raw_material'] : '';
                    $datasetmetaa2->a2_fuel_mix = !empty($valueF['a2_fuel_mix']) ? $valueF['a2_fuel_mix'] : '';
                    $datasetmetaa2->a2_fuel_mix_qty = !empty($valueF['a2_fuel_mix_qty']) ? $valueF['a2_fuel_mix_qty'] : '';
                    $datasetmetaa2->a2_fuel_density = !empty($valueF['a2_fuel_density']) ? $valueF['a2_fuel_density'] : '';
                    $datasetmetaa2->a2_fuel_calorific_value = !empty($valueF['a2_fuel_calorific_value']) ? $valueF['a2_fuel_calorific_value'] : '';
                    $datasetmetaa2->a2_fuel_embodied_energy_details_qty = !empty($valueF['a2_fuel_embodied_energy_details_qty']) ? $valueF['a2_fuel_embodied_energy_details_qty'] : '';
                    $datasetmetaa2->a2_fuel_embodied_carbon_details_unit = !empty($valueF['a2_fuel_embodied_carbon_details_unit']) ? $valueF['a2_fuel_embodied_carbon_details_unit'] : '';
                    $datasetmetaa2->a2_embodied_energy = !empty($valueF['a2_embodied_energy']) ? $valueF['a2_embodied_energy'] : '';
                    $datasetmetaa2->save();
                }
            }

             // A3 form data
             $formInputsA3Array = json_decode($request['formDataA3'], true);

            if(isset($formInputsA3Array) && !empty($formInputsA3Array))
            {
                foreach($formInputsA3Array as $keyF => $valueF)
                {
                    $datasetmetaa3 = new DatasetMetaA3();
                    $datasetmetaa3->cantributor_id = !empty($valueF['cantributor_id']) ? (int)$valueF['cantributor_id'] : 1;
                    $datasetmetaa3->contributor_meta_id = !empty($valueF['contributor_meta_id']) ? (int)$valueF['contributor_meta_id'] : 1;
                    $datasetmetaa3->dataset_meta_id = !empty($valueF['dataset_meta_id']) ? (int)$valueF['dataset_meta_id'] : 1;
                    $datasetmetaa3->dataseta3_category_id  = !empty($valueF['dataseta3_category_id'] ) ? (int)$valueF['dataseta3_category_id']  : 1;
                    $datasetmetaa3->dataseta3_category_name = !empty($valueF['dataseta3_category_name']) ? (int)$valueF['dataseta3_category_name'] : 1;;

                    $datasetmetaa3->a3_raw_material = !empty($valueF['a3_raw_material']) ? $valueF['a3_raw_material'] : '';
                    $datasetmetaa3->a3_manufacturing_technology = !empty($valueF['a3_manufacturing_technology']) ? $valueF['a3_manufacturing_technology'] : '';
                    $datasetmetaa3->a3_processes_undertaken_during_manufacturing = !empty($valueF['a3_processes_undertaken_during_manufacturing']) ? $valueF['a3_processes_undertaken_during_manufacturing'] : '';
                    $datasetmetaa3->a3_plant_standard_operation_temperature = !empty($valueF['a3_plant_standard_operation_temperature']) ? $valueF['a3_plant_standard_operation_temperature'] : '';
                    $datasetmetaa3->a3_plant_standard_operation_pressure = !empty($valueF['a3_plant_standard_operation_pressure']) ? $valueF['a3_plant_standard_operation_pressure'] : '';
                    $datasetmetaa3->a3_material_quality = !empty($valueF['a3_material_quality']) ? $valueF['a3_material_quality'] : '';
                    $datasetmetaa3->a3_fuel_mix = !empty($valueF['a3_fuel_mix']) ? $valueF['a3_fuel_mix'] : '';
                    $datasetmetaa3->a3_fuel_qty = !empty($valueF['a3_fuel_qty']) ? $valueF['a3_fuel_qty'] : '';
                    $datasetmetaa3->a3_fuel_density = !empty($valueF['a3_fuel_density']) ? $valueF['a3_fuel_density'] : '';
                    $datasetmetaa3->a3_calorific_value = !empty($valueF['a3_calorific_value']) ? $valueF['a3_calorific_value'] : '';
                    $datasetmetaa3->a1_embodied_energy_details_qty = !empty($valueF['fuel_mix_quantity']) ? $valueF['fuel_mix_quantity'] : '';
                    $datasetmetaa3->a3_characterization_factor = !empty($valueF['fuel_mix_unit']) ? $valueF['fuel_mix_unit'] : '';
                    $datasetmetaa3->a3_embodied_energy_for_reference_raw_materia_qty = !empty($valueF['fuel_density']) ? $valueF['fuel_density'] : '';

                    $datasetmetaa3->save();
                 }
             }

            if($datasetmeta) {
                return apiSuccessResponse($datasetmeta, 'Material & Category & Dataset meta & Dataset meta a1 form added successfully.');
            }
            else {
                return apiErrorResponse('Something went to wrong!');
            }

        } else {
            $datasetmeta = new DatasetMeta();
            $datasetmeta->material_id = !empty($request->input('material_id')) ? $request->input('material_id') : '';
            $datasetmeta->category_id = !empty($request->input('category_id')) ? $request->input('category_id') : '';
            $datasetmeta->manufacturer = !empty($request->input('manufacturer')) ? $request->input('manufacturer') : 'manufacturer';
            // $datasetmeta->material_image = !empty($filename) ? $filename : '';
            $datasetmeta->data_type_id = !empty($request->input('data_type_id')) ? $request->input('data_type_id') : 1;
            $datasetmeta->data_reliability_id = !empty($request->input('data_reliability_id')) ? $request->input('data_reliability_id') : 1;
            $datasetmeta->data_source_id = !empty($request->input('data_source_name')) ? $request->input('data_source_name') : 1;
            $datasetmeta->process_review_id = !empty($request->input('process_review_id')) ? $request->input('process_review_id') : 1;
            $datasetmeta->beginning_year = !empty($request->input('beginning_year')) ? $request->input('beginning_year') : 0;
            $datasetmeta->beginning_month = !empty($request->input('beginning_month')) ? $request->input('beginning_month') : 0;
            $datasetmeta->ending_year = !empty($request->input('ending_year')) ? $request->input('ending_year') : 0;
            $datasetmeta->ending_month = !empty($request->input('ending_month')) ? $request->input('ending_month') : 0;
            // $datasetmeta->start_date = date("Y-m-d", strtotime($request->input('start_date')));
            // $datasetmeta->end_time = date("Y-m-d", strtotime($request->input('end_date')));
            $datasetmeta->save();
            $last_insert_datasetmeta_id = $datasetmeta->id;

            $formInputsArray = json_decode($request['formDataA1']);
            if(isset($formInputsArray) && !empty($formInputsArray))
            {
                foreach($formInputsArray as $keyF => $valueF)
                {
                    $datasetmetaa1 = new DatasetMetaA1();
                    $datasetmetaa1->cantributor_id = !empty($valueF->cantributor_id) ? (int)$valueF->cantributor_id : 0;
                    $datasetmetaa1->contributor_meta_id = !empty($valueF->contributor_meta_id) ? (int)$valueF->contributor_meta_id : 1;
                    $datasetmetaa1->dataset_meta_id = !empty($valueF->dataset_meta_id) ? (int)$valueF->dataset_meta_id : 1;
                    $datasetmetaa1->dataseta1_category_id = !empty($valueF->dataset_category_id) ? (int)$valueF->dataset_category_id : 1;
                    $datasetmetaa1->dataseta1_category_name = !empty($valueF->dataset_category_name) ? (int)$valueF->dataset_category_name : 1;;

                    $datasetmetaa1->cantributor_id = !empty($valueF->cantributor_id) ? (int)$valueF->cantributor_id : 0;
                    $datasetmetaa1->contributor_meta_id = !empty($valueF->contributor_meta_id) ? (int)$valueF->contributor_meta_id : 1;
                    $datasetmetaa1->dataset_meta_id = !empty($valueF->dataset_meta_id) ? (int)$valueF->dataset_meta_id : 1;
                    $datasetmetaa1->dataseta1_category_id = !empty($valueF->dataset_category_id) ? (int)$valueF->dataset_category_id : 1;
                    $datasetmetaa1->dataseta1_category_name = !empty($valueF->dataset_category_name) ? (int)$valueF->dataset_category_name : 1;
                    $datasetmetaa1->a1_raw_material = !empty($valueF->a1_raw_material) ? $valueF->a1_raw_material : '';
                    $datasetmetaa1->a1_raw_material_qty = !empty($valueF->a1_raw_material_qty) ? $valueF->a1_raw_material_qty : '';
                    $datasetmetaa1->a1_raw_material_extraction_status = !empty($valueF->a1_raw_material_extraction_status) ? $valueF->a1_raw_material_extraction_status : '';
                    $datasetmetaa1->a1_raw_material_extraction_process = !empty($valueF->a1_raw_material_extraction_process) ? $valueF->a1_raw_material_extraction_process : '';
                    $datasetmetaa1->a1_raw_material_extraction_site_lat = !empty($valueF->a1_raw_material_extraction_site_lat) ? $valueF->a1_raw_material_extraction_site_lat : '';
                    $datasetmetaa1->a1_raw_material_extraction_site_lon = !empty($valueF->a1_raw_material_extraction_site_lon) ? $valueF->a1_raw_material_extraction_site_lon : '';
                    $datasetmetaa1->a1_raw_material_extraction_site_district = !empty($valueF->a1_raw_material_extraction_site_district) ? $valueF->a1_raw_material_extraction_site_district : '';
                    $datasetmetaa1->a1_raw_material_extraction_site_state = !empty($valueF->a1_raw_material_extraction_site_state) ? $valueF->a1_raw_material_extraction_site_state : '';
                    $datasetmetaa1->a1_fuel_mix = !empty($valueF->a1_fuel_mix) ? $valueF->a1_fuel_mix : '';
                    $datasetmetaa1->a1_fuel_qty = !empty($valueF->a1_fuel_qty) ? $valueF->a1_fuel_qty : '';
                    $datasetmetaa1->a1_fuel_density = !empty($valueF->a1_fuel_density) ? $valueF->a1_fuel_density : '';
                    $datasetmetaa1->a1_fuel_calorific_value = !empty($valueF->a1_fuel_calorific_value) ? $valueF->a1_fuel_calorific_value : '';
                    $datasetmetaa1->a1_embodied_energy_details = !empty($valueF->a1_embodied_energy_details) ? $valueF->a1_embodied_energy_details : '';
                    $datasetmetaa1->a1_characterization_factor = !empty($valueF->a1_characterization_factor) ? $valueF->a1_characterization_factor : '';
                    $datasetmetaa1->a1_embodied_energy_unit = !empty($valueF->a1_embodied_energy_unit) ? $valueF->a1_embodied_energy_unit : '';
                    $datasetmetaa1->save();
                }
            }

             // A2 form data
             $formInputsA2Array = json_decode($request['formDataA2'], true);
             if(isset($formInputsA2Array) && !empty($formInputsA2Array))
             {
                 foreach($formInputsA2Array as $keyF => $valueF)
                 {
                     $datasetmetaa2 = new DatasetMetaA2();
                     $datasetmetaa2->cantributor_id = !empty($valueF['cantributor_id']) ? (int)$valueF['cantributor_id'] : 1;
                     $datasetmetaa2->contributor_meta_id = !empty($valueF['contributor_meta_id']) ? (int)$valueF['contributor_meta_id'] : 1;
                     $datasetmetaa2->dataset_meta_id = !empty($valueF['dataset_meta_id']) ? (int)$valueF['dataset_meta_id'] : 1;
                     $datasetmetaa2->dataseta2_category_id  = !empty($valueF['dataseta2_category_id'] ) ? (int)$valueF['dataseta2_category_id']  : 1;
                     $datasetmetaa2->dataseta2_category_name = !empty($valueF['dataseta2_category_name']) ? (int)$valueF['dataseta2_category_name'] : 1;;

                     $datasetmetaa2->a2_raw_material = !empty($valueF['a2_raw_material']) ? $valueF['a2_raw_material'] : '';
                     $datasetmetaa2->a2_raw_material_manufacturing_plant = !empty($valueF['a2_raw_material_manufacturing_plant']) ? $valueF['a2_raw_material_manufacturing_plant'] : '';
                     $datasetmetaa2->a2_raw_material_extraction_site = !empty($valueF['a2_raw_material_extraction_site']) ? $valueF['a2_raw_material_extraction_site'] : '';
                     $datasetmetaa2->a2_raw_material_district = !empty($valueF['a2_raw_material_district']) ? $valueF['a2_raw_material_district'] : '';
                     $datasetmetaa2->a2_raw_material_state = !empty($valueF['a2_raw_material_state']) ? $valueF['a2_raw_material_state'] : '';
                     $datasetmetaa2->a2_raw_mat_distance_between_extraction_and_manufacturing_site = !empty($valueF['a2_raw_mat_distance_between_extraction_and_manufacturing_site']) ? $valueF['a2_raw_mat_distance_between_extraction_and_manufacturing_site'] : '';
                     $datasetmetaa2->a2_raw_material_vehicle_make = !empty($valueF['a2_raw_material_vehicle_make']) ? $valueF['a2_raw_material_vehicle_make'] : '';
                     $datasetmetaa2->a2_raw_material_vehicle_model = !empty($valueF['a2_raw_material_vehicle_model']) ? $valueF['a2_raw_material_vehicle_model'] : '';
                     $datasetmetaa2->a2_raw_material_vehicle_capacity = !empty($valueF['a2_raw_material_vehicle_capacity']) ? $valueF['a2_raw_material_vehicle_capacity'] : '';
                     $datasetmetaa2->a2_raw_material_vehicle_category = !empty($valueF['a2_raw_material_vehicle_category']) ? $valueF['a2_raw_material_vehicle_category'] : '';
                     $datasetmetaa2->a2_raw_material_trip_required_transporting_raw_material_qty = !empty($valueF['a2_raw_material_trip_required_transporting_raw_material_qty']) ? $valueF['a2_raw_material_trip_required_transporting_raw_material_qty'] : '';
                     $datasetmetaa2->a2_raw_material_total_distance_travel_transporting_raw_material = !empty($valueF['a2_raw_material_total_distance_travel_transporting_raw_material']) ? $valueF['a2_raw_material_total_distance_travel_transporting_raw_material'] : '';
                     $datasetmetaa2->a2_fuel_mix = !empty($valueF['a2_fuel_mix']) ? $valueF['a2_fuel_mix'] : '';
                     $datasetmetaa2->a2_fuel_mix_qty = !empty($valueF['a2_fuel_mix_qty']) ? $valueF['a2_fuel_mix_qty'] : '';
                     $datasetmetaa2->a2_fuel_density = !empty($valueF['a2_fuel_density']) ? $valueF['a2_fuel_density'] : '';
                     $datasetmetaa2->a2_fuel_calorific_value = !empty($valueF['a2_fuel_calorific_value']) ? $valueF['a2_fuel_calorific_value'] : '';
                     $datasetmetaa2->a2_fuel_embodied_energy_details_qty = !empty($valueF['a2_fuel_embodied_energy_details_qty']) ? $valueF['a2_fuel_embodied_energy_details_qty'] : '';
                     $datasetmetaa2->a2_fuel_embodied_carbon_details_unit = !empty($valueF['a2_fuel_embodied_carbon_details_unit']) ? $valueF['a2_fuel_embodied_carbon_details_unit'] : '';
                     $datasetmetaa2->a2_embodied_energy = !empty($valueF['a2_embodied_energy']) ? $valueF['a2_embodied_energy'] : '';
                     $datasetmetaa2->save();
                 }
             }

            // A3 form data
            $formInputsA3Array = json_decode($request['formDataA3'], true);

            if(isset($formInputsA3Array) && !empty($formInputsA3Array))
            {
                foreach($formInputsA3Array as $keyF => $valueF)
                {
                    $datasetmetaa3 = new DatasetMetaA3();
                    $datasetmetaa3->cantributor_id = !empty($valueF['cantributor_id']) ? (int)$valueF['cantributor_id'] : 1;
                    $datasetmetaa3->contributor_meta_id = !empty($valueF['contributor_meta_id']) ? (int)$valueF['contributor_meta_id'] : 1;
                    $datasetmetaa3->dataset_meta_id = !empty($valueF['dataset_meta_id']) ? (int)$valueF['dataset_meta_id'] : 1;
                    $datasetmetaa3->dataseta3_category_id  = !empty($valueF['dataseta3_category_id'] ) ? (int)$valueF['dataseta3_category_id']  : 1;
                    $datasetmetaa3->dataseta3_category_name = !empty($valueF['dataseta3_category_name']) ? (int)$valueF['dataseta3_category_name'] : 1;;

                    $datasetmetaa3->a3_raw_material = !empty($valueF['a3_raw_material']) ? $valueF['a3_raw_material'] : '';
                    $datasetmetaa3->a3_manufacturing_technology = !empty($valueF['a3_manufacturing_technology']) ? $valueF['a3_manufacturing_technology'] : '';
                    $datasetmetaa3->a3_processes_undertaken_during_manufacturing = !empty($valueF['a3_processes_undertaken_during_manufacturing']) ? $valueF['a3_processes_undertaken_during_manufacturing'] : '';
                    $datasetmetaa3->a3_plant_standard_operation_temperature = !empty($valueF['a3_plant_standard_operation_temperature']) ? $valueF['a3_plant_standard_operation_temperature'] : '';
                    $datasetmetaa3->a3_plant_standard_operation_pressure = !empty($valueF['a3_plant_standard_operation_pressure']) ? $valueF['a3_plant_standard_operation_pressure'] : '';
                    $datasetmetaa3->a3_material_quality = !empty($valueF['a3_material_quality']) ? $valueF['a3_material_quality'] : '';
                    $datasetmetaa3->a3_fuel_mix = !empty($valueF['a3_fuel_mix']) ? $valueF['a3_fuel_mix'] : '';
                    $datasetmetaa3->a3_fuel_qty = !empty($valueF['a3_fuel_qty']) ? $valueF['a3_fuel_qty'] : '';
                    $datasetmetaa3->a3_fuel_density = !empty($valueF['a3_fuel_density']) ? $valueF['a3_fuel_density'] : '';
                    $datasetmetaa3->a3_calorific_value = !empty($valueF['a3_calorific_value']) ? $valueF['a3_calorific_value'] : '';
                    $datasetmetaa3->a1_embodied_energy_details_qty = !empty($valueF['fuel_mix_quantity']) ? $valueF['fuel_mix_quantity'] : '';
                    $datasetmetaa3->a3_characterization_factor = !empty($valueF['fuel_mix_unit']) ? $valueF['fuel_mix_unit'] : '';
                    $datasetmetaa3->a3_embodied_energy_for_reference_raw_materia_qty = !empty($valueF['fuel_density']) ? $valueF['fuel_density'] : '';
                    $datasetmetaa3->save();
                }
            }


            if($datasetmeta) {
                return apiSuccessResponse($datasetmeta, 'Dataset meta & Dataset meta a1 form added successfully.');
            }
            else {
                return apiErrorResponse('Something went to wrong!');
            }

        }

        // $datasetMeta = new DatasetMeta();
        // $datasetMeta->material_id = !empty($request->input('material_name')) ? $last_insert_id : $request->input('material_id') ;
        // $datasetMeta->category_id = !empty($request->input('category_name')) ? $last_insert_category_id : $request->input('category_id');
        // $datasetMeta->manufacturer = $request->input('manufacturer');
        // $datasetMeta->data_type = $request->input('data_type');
        // $datasetMeta->data_reliability = $request->input('data_reliability');
        // $datasetMeta->data_source = $request->input('data_source');
        // $datasetMeta->process_reviewed = $request->input('process_reviewed');
        // $datasetMeta->start_date = $request->input('start_date');
        // $datasetMeta->end_time = $request->input('end_time');

        // if($request->hasfile('material_image')) {
        //     $datasetMeta->material_image = $filename;
        // }
        // $datasetMeta->save();

        // if($datasetMeta) {
        //     return apiSuccessResponse($datasetMeta, 'Dataset meta added successfully.');
        // }
        // else {
        //     return apiErrorResponse('Something went to wrong!');
        // }
    }

}
