
//http://bang590.github.io/JSPatchConvertor/
//https://github.com/bang590/JSPatch
//https://github.com/bang590/JSPatch/wiki

include('jscell.js');

require('UIView,UIButton,UIScreen,UIColor,UITableView,NSMutableArray,NSMutableDictionary,NSDictionary');
require('TestTableViewCell,TestModel');

defineClass('JSViewController: UIViewController<UITableViewDelegate,UITableViewDataSource>', ['data'],{
            viewDidLoad: function() {
            self.super().viewDidLoad();
            // Do any additional setup after loading the view, typically from a nib.
            self.view().setBackgroundColor(UIColor.whiteColor());
            self.setTitle("JSPatch 已生效");

            
            //data
            var arr = NSMutableArray.array();
            
            
            var dic = NSDictionary.dictionaryWithObjectsAndKeys("SANJI","imgName","点按 cell 显示 HUD","detail",null);
            var model = TestModel.alloc().initWithDictionary_error(dic,null);
            arr.addObject(model);
            
            
            dic = NSDictionary.dictionaryWithObjectsAndKeys("ZORO","imgName","关闭 switch，再按 cell，不显示 HUD","detail",null);
            model = TestModel.alloc().initWithDictionary_error(dic,null);
            arr.addObject(model);
            
            dic = NSDictionary.dictionaryWithObjectsAndKeys("NAMI","imgName","长按 cell 有弹框","detail",null);
            model = TestModel.alloc().initWithDictionary_error(dic,null);
            arr.addObject(model);
            
            dic = NSDictionary.dictionaryWithObjectsAndKeys("ACE","imgName","123","detail",null);
            model = TestModel.alloc().initWithDictionary_error(dic,null);
            arr.addObject(model);
            
            dic = NSDictionary.dictionaryWithObjectsAndKeys("BEPO","imgName","324","detail",null);
            model = TestModel.alloc().initWithDictionary_error(dic,null);
            arr.addObject(model);
            
            dic = NSDictionary.dictionaryWithObjectsAndKeys("FRANKY","imgName","999","detail",null);
            model = TestModel.alloc().initWithDictionary_error(dic,null);
            arr.addObject(model);
    
            self.setData(arr);
            
            //tableView
            var tableView = UITableView.alloc().initWithFrame(self.view().frame());
            tableView.setDelegate(self);
            tableView.setDataSource(self);
            self.view().addSubview(tableView);
            
            var footer = UIView.alloc().init();
            tableView.setTableFooterView(footer);
            },
            
//            tableView_didSelectRowAtIndexPath:function(tableView,indexPath){
//            tableView.deselectRowAtIndexPath_animated(indexPath);
//            },

            
            tableView_heightForRowAtIndexPath:function(tableView,indexPath){
            return JSCell.cellHeight();
            },
            
            tableView_numberOfRowsInSection:function(tableView, indexPath) {
            return self.data().count();
            },
            
            tableView_cellForRowAtIndexPath: function(tableView, indexPath) {
            var cell = tableView.dequeueReusableCellWithIdentifier("cell")
            if (!cell) {
            cell = JSCell.alloc().initWithStyle_reuseIdentifier(0, "cell")

            }

            var model = self.data().objectAtIndex(indexPath.row());
            cell.updateWithModel(model);
            return cell
            },
            
            });
