
//http://bang590.github.io/JSPatchConvertor/
//https://github.com/bang590/JSPatch
//https://github.com/bang590/JSPatch/wiki

//include('')
require('UIButton,UIScreen,UIColor,UITableView,UITableViewCell');
defineClass('JSViewController: UIViewController<UITableViewDelegate,UITableViewDataSource>', ['data'],{
            viewDidLoad: function() {
            self.super().viewDidLoad();
            // Do any additional setup after loading the view, typically from a nib.
            self.view().setBackgroundColor(UIColor.whiteColor());
            self.setTitle("JSPatch 已生效");
            self.setData(["a","b"]);
            var tableView = UITableView.alloc().initWithFrame(self.view().frame());
            tableView.setDelegate(self);
            tableView.setDataSource(self);
            self.view().addSubview(tableView);
            },
            tableView_numberOfRowsInSection:function(tableView, indexPath) {
            return 2;
            },
            tableView_cellForRowAtIndexPath: function(tableView, indexPath) {
            var cell = tableView.dequeueReusableCellWithIdentifier("cell")
            if (!cell) {
            cell = require('UITableViewCell').alloc().initWithStyle_reuseIdentifier(0, "cell")
            }
            cell.textLabel().setText(self.data()[indexPath.row()])
            console.log(cell.textLabel().text())
            return cell
            },
            });
