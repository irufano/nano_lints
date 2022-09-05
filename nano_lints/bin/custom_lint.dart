import 'dart:isolate';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

// import 'package:analyzer/dart/element/element.dart';
// import 'package:analyzer/dart/element/type.dart';
// import 'package:analyzer/dart/element/visitor.dart';
// import 'package:analyzer/source/source_range.dart';
// import 'package:analyzer_plugin/protocol/protocol_generated.dart';
// import 'package:analyzer_plugin/utilities/change_builder/change_builder_core.dart';
// import 'package:analyzer/dart/analysis/declared_variables.dart';
// import 'package:source_gen/source_gen.dart';

main(List<String> args, SendPort sendPort) {
  startPlugin(sendPort, NanoLint());
}

class NanoLint extends PluginBase {
  @override
  Stream<Lint> getLints(ResolvedUnitResult unit) async* {
    // lints
    // final library = unit.libraryElement;
    // final fileName = library.source.shortName;
    // final filePath = library.source.fullName;
    // final classes = library.topLevelElements.whereType<ClassElement>().toList();
    final classDeclaration = <ClassDeclaration>[];
    final variableDeclarations = <VariableDeclaration>[];
    final fieldDeclaration = <ConstructorFieldInitializer>[];
    final constructorDeclaration = <ConstructorDeclaration>[];
    final methodDeclaration = <MethodDeclaration>[];
    unit.unit.visitChildren(
      RecursiveVariableDeclarationVisitor(
        onVisitVariableDeclaration: variableDeclarations.add,
        onVisitConstructorFieldDeclaration: fieldDeclaration.add,
        onVisitConstructorDeclaration: constructorDeclaration.add,
        onMethodDeclaration: methodDeclaration.add,
        onVisitClassDeclaration: classDeclaration.add,
      ),
    );

    for (var s in constructorDeclaration) {
      final splitBody = s.body.toSource().split(',');

      for (var element in splitBody) {
        print(element);
        final condition1 =
            element.contains('fromJson') || element.contains('parse');
        final condition2 = element.trim().contains('== null ? null :');

        final property = s.body;
        if (condition1 && !condition2) {
          yield Lint(
            code: 'potentially_null_field',
            message: 'Potentially Null on \b[${element.trim()}]',
            severity: LintSeverity.warning,
            correction: 'Add null check with [== null ? null :]',
            // Where your lint will appear within the Dart file.
            // The following code will make appear at the top of the file (offset 0),
            // and be 10 characters long.
            location: unit.lintLocationFromOffset(property.offset,
                length: property.length),
            getAnalysisErrorFixes: (Lint lint) async* {
              // final session = unit.session;
              // final changeBuilder = ChangeBuilder(session: session);

              // await changeBuilder.addDartFileEdit(filePath, (builder) {
              //   builder.addReplacement(
              //     SourceRange(location!.offset, location.length),
              //     (replaceBuilder) {
              //       replaceBuilder.write(newClassName);
              //     },
              //   );
              // });

              // yield AnalysisErrorFixes(
              //   lint.asAnalysisError(),
              //   fixes: [
              //     PrioritizedSourceChange(
              //         1,
              //         changeBuilder.sourceChange
              //           ..message = 'Replace to $newClassName')
              //   ],
              // );
            },
          );
        }
      }

      // for (var element in found) {
      //   print(element);
      // }
    }

    // for (var classInstance in classes) {
    // final constructors = classInstance.constructors;
    // final variableEDeclarations = <TopLevelVariableElement>[];

    // for (var a in constructors) {
    //  a.declaration.
    // }

    // for (var b in variableEDeclarations) {
    //   print(b.name);
    // }
    // for (var e in classInstance.fields) {
    //     print('fieldName :'+ e.name);
    //     // print(e.parameters.length);
    //     // for (var p in e.parameters) {
    //     //    print(p.name);
    //     // }
    // }
    // for (var e in classInstance.constructors) {
    //     print('constructorname :'+ e.name);
    //     print(e.parameters.length);
    //     for (var p in e.parameters) {
    //        print(p.name);
    //     }
    // }
    // Ï}

    // if (fileName.contains('_service')) {
    //   final classes =
    //       library.topLevelElements.whereType<ClassElement>().toList();

    //   if (classes.length > 1) {
    //     yield Lint(
    //       code: 'one_class',
    //       message: 'only ine public class permitted',
    //       severity: LintSeverity.warning,
    //       correction: 'dasdasdfasd sad',
    //       // Where your lint will appear within the Dart file.
    //       // The following code will make appear at the top of the file (offset 0),
    //       // and be 10 characters long.
    //       location: unit.lintLocationFromLines(startLine: 1, endLine: 1),
    //     );
    //   } else {
    //     for (var classInstance in classes) {
    //       final name = classInstance.name;
    //       final location = classInstance.nameLintLocation;
    //       final newClassName = '${name}Service';

    //       if (!name.endsWith('Service')) {
    //         yield Lint(
    //           code: 'service_class',
    //           message: 'end class name must end with Service',
    //           severity: LintSeverity.warning,
    //           correction: 'Replace $name with $newClassName',
    //           // Where your lint will appear within the Dart file.
    //           // The following code will make appear at the top of the file (offset 0),
    //           // and be 10 characters long.
    //           location: unit.lintLocationFromLines(
    //             startLine: location?.startLine ?? 1,
    //             endLine: location?.endLine ?? 1,
    //             startColumn: location?.startColumn ?? 1,
    //             endColumn: location?.endColumn ?? 1,
    //           ),
    //           getAnalysisErrorFixes: (Lint lint) async* {
    //             final session = unit.session;
    //             final changeBuilder = ChangeBuilder(session: session);

    //             await changeBuilder.addDartFileEdit(filePath, (builder) {
    //               builder.addReplacement(
    //                 SourceRange(location!.offset, location.length),
    //                 (replaceBuilder) {
    //                   replaceBuilder.write(newClassName);
    //                 },
    //               );
    //             });

    //             yield AnalysisErrorFixes(
    //               lint.asAnalysisError(),
    //               fixes: [
    //                 PrioritizedSourceChange(1, changeBuilder.sourceChange..message = 'Replace to $newClassName')
    //               ],
    //             );
    //           },
    //         );
    //       }
    //     }
    //   }
    // }
  }
}

class RecursiveVariableDeclarationVisitor extends RecursiveAstVisitor<void> {
  RecursiveVariableDeclarationVisitor({
    required this.onVisitClassDeclaration,
    required this.onVisitVariableDeclaration,
    required this.onVisitConstructorFieldDeclaration,
    required this.onVisitConstructorDeclaration,
    required this.onMethodDeclaration,
  });

  void Function(ClassDeclaration node) onVisitClassDeclaration;
  void Function(VariableDeclaration node) onVisitVariableDeclaration;
  void Function(ConstructorFieldInitializer node)
      onVisitConstructorFieldDeclaration;
  void Function(ConstructorDeclaration node) onVisitConstructorDeclaration;
  void Function(MethodDeclaration node) onMethodDeclaration;

  @override
  void visitClassDeclaration(ClassDeclaration node) {
    onVisitClassDeclaration(node);
    super.visitClassDeclaration(node);
  }

  @override
  void visitVariableDeclaration(VariableDeclaration node) {
    onVisitVariableDeclaration(node);
    super.visitVariableDeclaration(node);
  }

  @override
  void visitConstructorFieldInitializer(ConstructorFieldInitializer node) {
    onVisitConstructorFieldDeclaration(node);
    super.visitConstructorFieldInitializer(node);
  }

  @override
  void visitConstructorDeclaration(ConstructorDeclaration node) {
    onVisitConstructorDeclaration(node);
    super.visitConstructorDeclaration(node);
  }

  @override
  void visitMethodDeclaration(MethodDeclaration node) {
    onMethodDeclaration(node);
    super.visitMethodDeclaration(node);
  }
}
