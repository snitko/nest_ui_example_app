import 'package:nest_ui/nest_ui.dart';
import 'dart:html';

// Importing Report Adapters that we'll actually use.
import 'package:logmaster/report_adapters/console_report_adapter.dart';

class RootComponent extends Component {
}

class ButtonComponent extends Component {
  final List attribute_names = ["caption"];
  List native_events = ["click"];
}

class CommentComponent extends Component {
  final List attribute_names = ["body"];
  List native_events = ["delete.click"];
  CommentComponent() {
    event_handlers.add(event: 'click', role: 'self.delete', handler: (self,p) => self.remove());
  }
}

class CommentFormComponent extends Component {

  Map validations = {
    'content.value': { 'isLongerThan' : 5 }
  };

  CommentFormComponent() {
    event_handlers.add(event: 'click', role: 'submit', handler: (self,p) {
      if(this.validate(deep: true)) {
        var new_comment = new CommentComponent();
        new_comment.body = self.children[0].value;
        self.parent.addChild(new_comment);
        self.applyToChildren('reset');
      }
    });
  }
}

class TextAreaComponent extends FormComponent {
}

main() {
  var logger = new Logmaster([new ConsoleReportAdapter()]);
  try {
    var root         = new RootComponent();
    root.dom_element = querySelector('body');
    root.initChildComponents();
  } catch(e) {
    logger.capture(e);
  }
}
