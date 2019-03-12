<?php

class Comments extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();

        $this->CI =& get_instance();
        $this->load->model('news_comments_model');
        $this->load->model('comments_likes_model');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store()
    {
        $inserted_id = News_comments_model::insert_new_comment();
        if ($inserted_id != FALSE) {
            $this->response(['id' => $inserted_id]);
        } else {
           $this->response([], self::HTTP_BAD);
        }
    }

    /**
     * Delete resource from storage.
     */
    public function delete($id)
    {
        News_comments_model::delete_comment($id);
        $this->response([]); 
    }

    /**
     * Put like.
     */
    public function like($id)
    {
        Comments_likes_model::like($id);
        $this->response([]); 
    }

    /**
     * Delete like.
     */
    public function unlike($id)
    {
        Comments_likes_model::unlike($id);
        $this->response([]); 
    }
}
