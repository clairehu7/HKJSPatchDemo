require('UIScreen,UISwitch,UILabel,UIImageView,UILongPressGestureRecognizer');
require('UIAlertView,UIApplication,UIImage');
require('UIColor,MBProgressHUD');

defineClass('JSCell: UITableViewCell', [ 'switchView','label','imgView','SwitchOn'], {
            initWithStyle_reuseIdentifier:function(style,reuseIdentifier){
            self = self.super().initWithStyle_reuseIdentifier(style,reuseIdentifier);
            self.commonInit();
            return self;
            },
            
            
            setSelected_animated: function(selected, animated) {
            self.super().setSelected_animated(selected, animated);
            if (!selected) {
            return;
            }
            if (!_switchON) {
            return;
            } else {
            MBProgressHUD.showHUDAddedTo_animated(self.superview(), YES);
            self.performSelector_withObject_afterDelay("hideHUD", null, 1);
            }
            },
            
            updateWithModel:function(model){
            _label.setText(model.detail());
            _imgView.setImage(UIImage.imageNamed(model.imgName()));
            },
            
            hideHUD: function() {
            MBProgressHUD.hideHUDForView_animated(self.superview(), YES);
            },
            
            switchTUI: function(sender) {
            _switchON = !_switchON;
            if (!_switchON) {
            self.setBackgroundColor(UIColor.blackColor());
            _label.setTextColor(UIColor.whiteColor());
            } else {
            self.setBackgroundColor(UIColor.whiteColor());
            _label.setTextColor(UIColor.blackColor());
            }
            },
            
            commonInit: function() {
            self.setSelectionStyle(0);

            _switchON = YES;
            var cellWidth = UIScreen.mainScreen().bounds().width;
            var cellHeight = JSCell.cellHeight();
            console.log(cellHeight +'1111');
            _switchView = UISwitch.alloc().init();
            _switchView.setFrame({x:(cellWidth - 71),y: (cellHeight - 31) / 2,width: 51, height:31});
            _switchView.setOn(YES);
            _switchView.addTarget_action_forControlEvents(self, "switchTUI:", 64);
            self.contentView().addSubview(_switchView);
            
            _label = UILabel.alloc().init();
            _label.setFrame({x:100,y: 0, width:(cellWidth - 200), height:cellHeight});
            _label.setNumberOfLines(0);
            _label.setTextColor( UIColor.colorWithRed_green_blue_alpha(0.3, 0.5, 0.1, 1));

            self.contentView().addSubview(_label);
            
            _imgView = UIImageView.alloc().init();
            _imgView.setFrame({x:20,y: 10, width:60, height:60});
            self.contentView().addSubview(_imgView);
            
            var lpgr = UILongPressGestureRecognizer.alloc().initWithTarget_action(self, "handleLongPress:");
            lpgr.setMinimumPressDuration(1.5);
            lpgr.setDelegate(self);
            self.contentView().addGestureRecognizer(lpgr);
            },
            
            
            handleLongPress: function(gestureRecognizer) {
            if (gestureRecognizer.state() == 1) {
            
            var message = "switchOn";
            if (!_switchON) {
            message = "switchOff";
            } else {
            message = "switchOn";
            }
            var alert = UIAlertView.alloc().initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles("提示", message, null, "OK", null, null);
            alert.show();
            }
            },
           
            
            },{
            cellHeight:function (){
            return 80;
            },
            });
