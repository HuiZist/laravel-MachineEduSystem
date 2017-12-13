<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreLessonSortRequest extends FormRequest
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

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function messages()
    {
        return [
            'name.required' => '分类名不能为空',
            'name.min' => '分类名不能少于3个字符',
            'name.max' => '分类名不能大于30个字符',
            'thumbnail.image' => '缩略图必须为图片格式',
            'thumbnail.dimensions' => '缩略图最小宽度为220px，最小高度为180px',
            'abstract.required' => '简介不能为空',
            'abstract.min' => '简介不能少于6个字符'
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
            'name'=>'required|min:3|max:30',
            'thumbnail'=>'image|dimensions:min_width=220,min-height=180',
            'abstract'=>'required|min:6'
        ];
    }
}
