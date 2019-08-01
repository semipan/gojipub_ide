<?php
/**
 * 在线编辑模板IDE
 */
class idePlugin extends Core\Library\Plugins
{
    /**
     * 用来初始化插件，一般用于安装时使用
     *
     * @return void
     */
    public function init()
    {
        echo '在线编辑模板IDE';
    }

    /**
     * 遍历资源目录
     *
     * @return void
     */
    public function index()
    {
        $this->view->pagetitle = '在线编辑模板IDE';
        //读取站点的配置
        $config = file_get_contents(CORE_PATH . "/config/site.json");
        $config = json_decode($config, true);
        $this->view->host = $config['host'];
        $rows = Core\Library\Common::getDirContent(BASE_PATH . "/public/upload/");
        $this->view->rows = $rows;
        $content = file_get_contents($this->themeDir . 'template/index/index.volt');
        $this->view->content = $content;
    }

    /**
     * 删除文件
     *
     * @return void
     */
    public function delete()
    {
        echo $this->request->getQuery("file");
    }

    public function dir()
    {
        $path = $this->request->getQuery('path', ['trim', 'string']);
        $rows = Core\Library\Common::getDirContent($this->themeDir . $path);
        if ($rows) {
            if ($path) {
                $arr = array_values(array_filter(explode('/', $path)));
                if (count($arr) > 1) {
                    isset($this->themeConf['structure'][$arr[0]]['structure'][$arr[1]]['structure']) && $structure = $this->themeConf['structure'][$arr[0]]['structure'][$arr[1]]['structure'];
                } else {
                    isset($this->themeConf['structure'][$arr[0]]['structure']) && $structure = $this->themeConf['structure'][$arr[0]]['structure'];
                }
            } else {
                isset($this->themeConf['structure']) && $structure = $this->themeConf['structure'];
            }
            /**
             * 根据模板配置的信息增加别名字段
             */
            foreach ($rows as $k => $v) {
                if ($v['type'] == 'FILE') {
                    $rows[$k]['ext'] = substr($v['name'], strrpos($v['name'], '.') + 1); //获取文件扩展名
                }
                $rows[$k]['path'] = $path . '/' . $v['name'];
                $rows[$k]['md5'] = md5($path . '/' . $v['name']);
                $rows[$k]['alias'] = '';
                if (isset($structure[$v['name']]['alias'])) {
                    $rows[$k]['alias'] = $structure[$v['name']]['alias'];
                }
                if (empty($path) && $v['name'] == 'config.json') {
                    unset($rows[$k]); //配置文件不展示
                }
            }
        }
        $json = ['code' => 0, 'msg' => 'success', 'data' => $rows];
        $this->response->setJsonContent($json);
        $this->response->send();
    }

    public function file()
    {
        $path = $this->request->getQuery('path', ['trim', 'string']);
        $content = file_get_contents($this->themeDir . $path);
        $json = ['code' => 0, 'msg' => 'success', 'data' => $content];
        $this->response->setJsonContent($json);
        $this->response->send();
    }

    public function save()
    {
        $file = $this->request->getPost('path', ['trim', 'string']);
        $content = $this->request->getPost('content');
        $path = $this->themeDir . $file;
        if (is_writable($path)) {
            file_put_contents($path, $content);
            $json = ['code' => 0, 'msg' => 'success'];
        } else {
            $json = ['code' => 1, 'msg' => '文件权限不够，无法写入，请检查'];
        }
        $this->response->setJsonContent($json);
        $this->response->send();
    }
}
