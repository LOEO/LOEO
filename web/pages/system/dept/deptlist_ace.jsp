<%--
  Created by IntelliJ IDEA.
  User: LT
  Date: 14-7-17
  Time: 下午11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../common/strat.jsp"%>
<div class="page-content">
    <div class="row">

        <div class="col-sm-3">
            <div class="widget-box" >
                <div class="widget-header header-color-blue2">
                    <h4 class="lighter smaller">组织机构</h4>
                </div>
                <div class="widget-body">
                    <div class="widget-main padding-1">
                        <div id="tree" class="tree"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9">
            <form class="form-horizontal" role="form">
                <div class="form-group">

                    <button class="btn btn-primary">新增</button>
                    <button class="btn btn-success">保存</button>
                    <button class="btn btn-danger">删除</button>
                 </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 名称： </label>

                    <div class="col-sm-9">
                        <input type="text" id="form-field-1" name="name" placeholder="" class="col-xs-10 col-sm-10" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 父节点： </label>

                    <div class="col-sm-9">
                        <input type="text" id="form-field-2" name="parent" placeholder="" class="col-xs-10 col-sm-10" />
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>
<%@include file="../common/end.jsp"%>
<script src="${ctx}/ace/assets/js/fuelux/fuelux.tree.min.js"></script>
<script>
    $(function(){
        $('#tree').ace_tree({
            dataSource: treeDataSource2 ,
            loadingHTML:'<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
            'open-icon' : 'icon-folder-open',
            'close-icon' : 'icon-folder-close',
            'selectable' : false,
            'selected-icon' : null,
            'unselected-icon' : null
        });

    });

    var DataSourceTree = function(options) {
        this._data 	= options.data;
        this._delay = options.delay;
    }

    DataSourceTree.prototype.data = function(options, callback) {
        var self = this;
        var $data = null;

        if(!("name" in options) && !("type" in options)){
            $data = this._data;//the root tree
            callback({ data: $data });
            return;
        }
        else if("type" in options && options.type == "folder") {
            if("additionalParameters" in options && "children" in options.additionalParameters)
                $data = options.additionalParameters.children;
            else $data = {}//no data
        }

        if($data != null)//this setTimeout is only for mimicking some random delay
            setTimeout(function(){callback({ data: $data });} , parseInt(Math.random() * 500) + 200);

        //we have used static data here
        //but you can retrieve your data dynamically from a server using ajax call
        //checkout examples/treeview.html and examples/treeview.js for more info
    };

    var tree_data_2 = {
        'pictures' : {name: 'Pictures', type: 'folder', 'icon-class':'red'}	,
        'music' : {name: 'Music', type: 'folder', 'icon-class':'orange'}	,
        'video' : {name: 'Video', type: 'folder', 'icon-class':'blue'}	,
        'documents' : {name: 'Documents', type: 'folder', 'icon-class':'green'}	,
        'backup' : {name: 'Backup', type: 'folder'}	,
        'readme' : {name: '<i class="icon-file-text grey"></i> ReadMe.txt', type: 'item'},
        'manual' : {name: '<i class="icon-book blue"></i> Manual.html', type: 'item'}
    }
    tree_data_2['music']['additionalParameters'] = {
        'children' : [
            {name: '<i class="icon-music blue"></i> song1.ogg', type: 'item'},
            {name: '<i class="icon-music blue"></i> song2.ogg', type: 'item'},
            {name: '<i class="icon-music blue"></i> song3.ogg', type: 'item'},
            {name: '<i class="icon-music blue"></i> song4.ogg', type: 'item'},
            {name: '<i class="icon-music blue"></i> song5.ogg', type: 'item'}
        ]
    }
    tree_data_2['video']['additionalParameters'] = {
        'children' : [
            {name: '<i class="icon-film blue"></i> movie1.avi', type: 'item'},
            {name: '<i class="icon-film blue"></i> movie2.avi', type: 'item'},
            {name: '<i class="icon-film blue"></i> movie3.avi', type: 'item'},
            {name: '<i class="icon-film blue"></i> movie4.avi', type: 'item'},
            {name: '<i class="icon-film blue"></i> movie5.avi', type: 'item'}
        ]
    }
    tree_data_2['pictures']['additionalParameters'] = {
        'children' : {
            'wallpapers' : {name: 'Wallpapers', type: 'folder', 'icon-class':'pink'},
            'camera' : {name: 'Camera', type: 'folder', 'icon-class':'pink'}
        }
    }
    tree_data_2['pictures']['additionalParameters']['children']['wallpapers']['additionalParameters'] = {
        'children' : [
            {name: '<i class="icon-picture green"></i> wallpaper1.jpg', type: 'item'},
            {name: '<i class="icon-picture green"></i> wallpaper2.jpg', type: 'item'},
            {name: '<i class="icon-picture green"></i> wallpaper3.jpg', type: 'item'},
            {name: '<i class="icon-picture green"></i> wallpaper4.jpg', type: 'item'}
        ]
    }
    tree_data_2['pictures']['additionalParameters']['children']['camera']['additionalParameters'] = {
        'children' : [
            {name: '<i class="icon-picture green"></i> photo1.jpg', type: 'item'},
            {name: '<i class="icon-picture green"></i> photo2.jpg', type: 'item'},
            {name: '<i class="icon-picture green"></i> photo3.jpg', type: 'item'},
            {name: '<i class="icon-picture green"></i> photo4.jpg', type: 'item'},
            {name: '<i class="icon-picture green"></i> photo5.jpg', type: 'item'},
            {name: '<i class="icon-picture green"></i> photo6.jpg', type: 'item'}
        ]
    }
    tree_data_2['documents']['additionalParameters'] = {
        'children' : [
            {name: '<i class="icon-file-text red"></i> document1.pdf', type: 'item'},
            {name: '<i class="icon-file-text grey"></i> document2.doc', type: 'item'},
            {name: '<i class="icon-file-text grey"></i> document3.doc', type: 'item'},
            {name: '<i class="icon-file-text red"></i> document4.pdf', type: 'item'},
            {name: '<i class="icon-file-text grey"></i> document5.doc', type: 'item'}
        ]
    }

    tree_data_2['backup']['additionalParameters'] = {
        'children' : [
            {name: '<i class="icon-archive brown"></i> backup1.zip', type: 'item'},
            {name: '<i class="icon-archive brown"></i> backup2.zip', type: 'item'},
            {name: '<i class="icon-archive brown"></i> backup3.zip', type: 'item'},
            {name: '<i class="icon-archive brown"></i> backup4.zip', type: 'item'}
        ]
    }
    var treeDataSource2 = new DataSourceTree({data: tree_data_2});
</script>