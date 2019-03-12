<?php

/**
 * Created by PhpStorm.
 * User: mr.incognito
 * Date: 10.11.2018
 * Time: 10:10
 */
class News_model extends MY_Model
{
    const NEWS_TABLE = APPLICATION_NEWS;
    const PAGE_LIMIT = 5;
    const LIMIT_NEWS = 3;

    protected $id;
    protected $header;
    protected $short_description;
    protected $text;
    protected $img;
    protected $tags;
    protected $time_created;
    protected $time_updated;

    protected $views;

    protected $comments;
    protected $likes;

    function __construct($id = FALSE)
    {
        parent::__construct();
        $this->class_table = self::NEWS_TABLE;
        $this->set_id($id);
    }

    /**
     * @return string
     */
    public function get_header()
    {
        return $this->header;
    }

    /**
     * @param mixed $header
     */
    public function set_header($header)
    {
        $this->header = $header;
        return $this->_save('header', $header);
    }

    /**
     * @return string
     */
    public function get_short_description()
    {
        return $this->short_description;
    }

    /**
     * @param mixed $description
     */
    public function set_short_description($description)
    {
        $this->short_description = $description;
        return $this->_save('short_description', $description);
    }

    /**
     * @return string
     */
    public function get_full_text()
    {
        return $this->text;
    }


    /**
     * @return mixed
     */
    public function get_image()
    {
        return $this->img;
    }

    /**
     * @param mixed $image
     */
    public function set_image($image)
    {
        $this->img = $image;
        return $this->_save('image', $image);
    }

    /**
     * @return string
     */
    public function get_tags()
    {
        return $this->tags;
    }

    /**
     * @param mixed $tags
     */
    public function set_tags($tags)
    {
        $this->tags = $tags;
        return $this->_save('tags', $tags);
    }

    /**
     * @return mixed
     */
    public function get_time_created()
    {
        return $this->time_created;
    }

    /**
     * @param mixed $time_created
     */
    public function set_time_created($time_created)
    {
        $this->time_created = $time_created;
        return $this->_save('time_created', $time_created);
    }

    /**
     * @return int
     */
    public function get_time_updated()
    {
        return strtotime($this->time_updated);
    }

    /**
     * @param mixed $time_updated
     */
    public function set_time_updated($time_updated)
    {
        $this->time_updated = $time_updated;
        return $this->_save('time_updated', $time_updated);
    }

    /**
     * @return News_like_model
     */
    public function get_likes()
    {
        return $this->likes;
    }

    /**
     * @return News_comments_model[]
     */
    public function get_comments()
    {
        return $this->comments;
    }

    /**
     * @param int $page
     * @param bool|string $preparation
     * @return array
     */
    public static function get_all($preparation = FALSE)
    {

        $CI =& get_instance();

        $data = [];

        $news = $CI->s->sql('SELECT news.id AS news_id, news.header, news.short_description, news.text, news.img, news.tags, news.status, news.time_created, (SELECT COUNT(id) FROM news_likes WHERE new_id=news_id) AS likes FROM news LIMIT '.self::LIMIT_NEWS)->many();

        foreach ($news as $key => $new) {
            $news[$key]['comments'] = $CI->s->sql('SELECT news_comments.id AS comments_id, news_comments.comment, (SELECT COUNT(id) FROM comments_likes WHERE comments_likes.comment_id=comments_id) AS likes FROM news_comments WHERE news_comments.new_id='.$new['news_id'])->many();
        }
         return $news;


        $news_list = [];
        foreach ($_data as $_item) {
            $news_list[] = (new self())->load_data($_item);
        }

        if ($preparation === FALSE) {
            return $news_list;
        }

        return self::preparation($news_list, $preparation);
    }

    public static function preparation($data, $preparation)
    {

        switch ($preparation) {
            case 'short_info':
                return self::_preparation_short_info($data);
            default:
                throw new Exception('undefined preparation type');
        }
    }

    /**
     * @param News_model[] $data
     * @return array
     */
    private static function _preparation_short_info($data)
    {
        $res = [];
        foreach ($data as $item) {
            $_info = new stdClass();
            $_info->id = (int)$item->get_id();
            $_info->header = $item->get_header();
            $_info->description = $item->get_short_description();
            $_info->img = $item->get_image();
            $_info->time = $item->get_time_updated();
            $res[] = $_info;
        }
        return $res;
    }
    
    
    public static function create($data){

        $CI =& get_instance();
	    $res = $CI->s->from(self::NEWS_TABLE)->insert($_insert_data)->execute();
	    if(!$res){
	        return FALSE;
        }
	    return new self($CI->s->insert_id);
    }

    // public function showAll()
    // {
    //    $query = $this->db->get(self::TABLE);
    //    $query = $this->db->get(self::TABLE);
       
    //     if($query->num_rows() > 0) {
    //         return $query->result();
    //     } else {
    //         return false;
    //     }
    // }
    

}
