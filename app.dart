import 'package:nest_ui/nest_ui.dart';
import 'dart:html';

class RootComponent extends Component {
}

class ButtonComponent extends Component {
  final List attribute_names = ["caption"];
  List native_events = ["click"];
  ButtonComponent() : super () {
    event_handlers.add(event: 'click', role: #self, handler: (self) {
      self.publishEvent("click");
    });
  }
}

class CommentComponent extends Component {
  final List attribute_names = ["body"];
}

class CommentFormComponent extends Component {
  CommentFormComponent() : super() {
    event_handlers.add(event: 'click', role: 'submit', handler: (self,p) {
      var new_comment = new CommentComponent();
      new_comment.body = self.dom_element.querySelector('textarea').value;
      new_comment.initDomElementFromTemplate();
      self.parent.addChild(new_comment);
      self.parent.dom_element.append(new_comment.dom_element);
    });
  }
}

class TextAreaComponent extends Component {
  final List attribute_names = ["text"];
}

main() {
  var root         = new RootComponent();
  root.dom_element = querySelector('body');
  root.initChildComponents();
}
