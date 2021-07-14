<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class IndexController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(Request $request)
    {
        $this->request = $request;
    }

    public function api(Request $request) {
      $input  = $this->request->all();
      $action = $input["action"];
      return $this->$action($input);
    }

    function list($input) {
      $connect = DB::connection($input["db"])->table($input["table"]);

      if (!empty($input["leftJoin"])) {
        foreach ($input["leftJoin"] as $list) {
          $connect->leftJoin($list["table"], $list["field1"], '=', $list["field2"]);
        }
      }

      if (isset($input["innerJoin"])) {
        foreach ($input["innerJoin"] as $list) {
          $connect->join($list["table"], $list["field1"], '=', $list["field2"]);
        }
      }

      if (isset($input["whereraw"])) {
          $connect->whereRaw($input["whereraw"]);
      }

      if(isset($input["where"][0])) {
        $connect->where($input["where"]);
      }

      if(isset($input["whereOr"][0])) {
        $connect->orWhere($input["where"]);
      }

      if(isset($input["whereIn"][0])) {
        $in        = $input["whereIn"];
        $connect->whereIn($in[0], $in[1]);
      }

      if(isset($input["whereNotIn"][0])) {
        $in        = $input["whereNotIn"];
        $connect->whereNotIn($in[0], $in[1]);
      }

      if (!empty($input["whereBetween"])) {
        $connect->whereBetween($input["whereBetween"][0],[$input["whereBetween"][1],$input["whereBetween"][2]]);
      }

      if(isset($input["groupby"])) {
        $connect->groupBy($input["groupby"]);
      }

      if(isset($input["raw"]["groupby"])) {
        $connect->groupBy(DB::raw($input["raw"]["groupby"]));
      }

      if (isset($input["raw"]["selected"])) {
        $connect->select(DB::raw($input["raw"]["selected"]));
      }

      if (isset($input["selected"])) {
        $connect->select($input["selected"]);
      }

      if(isset($input["orderBy"][0])) {
        $in        = $input["orderBy"];
        $connect->orderby($in[0], $in[1]);
      }

      if (isset($input['start'])) {
        if (!empty($input['limit'])) {
          $connect->skip($input['start'])->take($input['limit']);
        }
      }

      $result = $connect->get();
      $count  = count($result);

      return ["count" => $count, "result"=>$result];
    }

    function test_output($input) {
      return $input;
    }

    function cekLogin($input) {
       $data = DB::connection($input["db"])->table($input["table"])->where([$input["value"]])->first();
       if (!empty($data)) {
         return ["message"=>"Login Success", "data"=>$data];
       } else {
         return ["message"=> "Check Your Username / Password"];
       }
     }
}
