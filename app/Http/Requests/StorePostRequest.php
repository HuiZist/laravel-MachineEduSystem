<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StorePostRequest extends FormRequest
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
            'title.required' => '标题不能为空',
            'title.min' => '标题不能少于3个字符',
            'title.max' => '标题不能大于60个字符',
            'content.required' => '内容不能为空',
            'content.min' => '内容不能少于3个字符'
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
            'content'=>'required|min:10',
        ];
    }
}
