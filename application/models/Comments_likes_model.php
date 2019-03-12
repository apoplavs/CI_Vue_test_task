<?php

class Comments_likes_model extends MY_Model
{
    const TABLE = 'comments_likes';

    protected $id;
    protected $comment_id;
    protected $time_created;
    protected $time_updated;

    function __construct()
    {
        parent::__construct();
        $this->class_table = self::TABLE;
    }

    public function like($comment_id)
    {
        $CI =& get_instance();

        $res = $CI->s->from(self::TABLE)->insert([
            'comment_id' =>$comment_id
        ])->execute();

        if(!$res){
            return FALSE;
        }
        return new self($CI->s->insert_id);
    }

    public function unlike($comment_id)
    {
        $CI =& get_instance();

        $CI->s->from(self::TABLE)
        ->where('comment_id', $comment_id)
        ->delete()
        ->limit(1)
        ->execute();
    }
}