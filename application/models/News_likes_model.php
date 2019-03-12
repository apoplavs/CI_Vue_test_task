<?php

class News_likes_model extends MY_Model
{
    const TABLE = 'news_likes';

    protected $id;
    protected $new_id;
    protected $time_created;
    protected $time_updated;

    function __construct($id = FALSE)
    {
        parent::__construct();
        $this->class_table = self::TABLE;
    }

    public function like($news_id)
    {
        $CI =& get_instance();

        $res = $CI->s->from(self::TABLE)->insert([
            'new_id' =>$news_id
        ])->execute();

        if(!$res){
            return FALSE;
        }
        return new self($CI->s->insert_id);
    }

    public function unlike($news_id)
    {
        $CI =& get_instance();

        $CI->s->from(self::TABLE)
        ->where('new_id', $news_id)
        ->delete()
        ->limit(1)
        ->execute();
    }
}