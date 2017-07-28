<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreLessonRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    public function messages()
    {
        return [
            'title.required' => '课程名不能为空',
            'title.min' => '课程名不能少于3个字符',
            'title.max' => '课程名不能大于60个字符',
            'body.required' => '课程内容不能为空',
            'body.min' => '课程内容不能少于6个字符'
        ];
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'title'=>'required|min:3|max:60',
            'body'=>'required|min:13'
        ];
    }
}
