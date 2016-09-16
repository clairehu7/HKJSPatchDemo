require('UIColor');
defineClass('ViewController', {
            viewDidLoad: function() {
            self.super().viewDidLoad();
            // Do any additional setup after loading the view, typically from a nib.
            self.view().setBackgroundColor(UIColor.whiteColor());
            self.setTitle("JSPatch已生效");
            },
            });
