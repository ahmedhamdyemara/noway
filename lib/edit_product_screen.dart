import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/product.dart';
import '/products.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlxController = TextEditingController();
  final _imageUrlxxController = TextEditingController();
  final _imageUrlxxxController = TextEditingController();
  final _imageUrlxxxxController = TextEditingController();
  final _imageUrlxxxxxController = TextEditingController();
  final _imageUrlxxxxxxController = TextEditingController();
  final _imageUrlxxxxxxxController = TextEditingController();
  final _imageUrlxxxxxxxxController = TextEditingController();

  final _imageUrlFocusNode = FocusNode();
  final _imageUrlxFocusNode = FocusNode();
  final _imageUrlxxFocusNode = FocusNode();
  final _imageUrlxxxFocusNode = FocusNode();
  final _imageUrlxxxxFocusNode = FocusNode();
  final _imageUrlxxxxxFocusNode = FocusNode();
  final _imageUrlxxxxxxFocusNode = FocusNode();
  final _imageUrlxxxxxxxFocusNode = FocusNode();
  final _imageUrlxxxxxxxxFocusNode = FocusNode();

  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    id: null,
    title: '',
    price: 0,
    description: '',
    imageUrl: '',
    imageUrlx: '',
    imageUrlxx: '',
    imageUrlxxx: '',
    imageUrlxxxx: '',
    imageUrlxxxxx: '',
    imageUrlxxxxxx: '',
    imageUrlxxxxxxx: '',
    imageUrlxxxxxxxx: '',
  );
  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
    'imageUrlx': '',
    'imageUrlxx': '',
    'imageUrlxxx': '',
    'imageUrlxxxx': '',
    'imageUrlxxxxx': '',
    'imageUrlxxxxxx': '',
    'imageUrlxxxxxxx': '',
    'imageUrlxxxxxxxx': '',
  };
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);

    _imageUrlxFocusNode.addListener(_updateImageUrlx);
    _imageUrlxxFocusNode.addListener(_updateImageUrlxx);
    _imageUrlxxxFocusNode.addListener(_updateImageUrlxxx);
    _imageUrlxxxxFocusNode.addListener(_updateImageUrlxxxx);
    _imageUrlxxxxxFocusNode.addListener(_updateImageUrlxxxxx);
    _imageUrlxxxxxxFocusNode.addListener(_updateImageUrlxxxxxx);
    _imageUrlxxxxxxxFocusNode.addListener(_updateImageUrlxxxxxxx);
    _imageUrlxxxxxxxxFocusNode.addListener(_updateImageUrlxxxxxxxx);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        _editedProduct =
            Provider.of<Products>(context, listen: false).findById(productId);
        _initValues = {
          'title': _editedProduct.title,
          'description': _editedProduct.description,
          'price': _editedProduct.price.toString(),
          // 'imageUrl': _editedProduct.imageUrl,
          'imageUrl': '',
          'imageUrlx': '',
          'imageUrlxx': '',
          'imageUrlxxx': '',
          'imageUrlxxxx': '',
          'imageUrlxxxxx': '',
          'imageUrlxxxxxx': '',
          'imageUrlxxxxxxx': '',
          'imageUrlxxxxxxxx': '',
        };
        _imageUrlController.text = _editedProduct.imageUrl;
        _imageUrlxController.text = _editedProduct.imageUrlx;
        _imageUrlxxController.text = _editedProduct.imageUrlxx;
        _imageUrlxxxController.text = _editedProduct.imageUrlxxx;
        _imageUrlxxxxController.text = _editedProduct.imageUrlxxxx;
        _imageUrlxxxxxController.text = _editedProduct.imageUrlxxxxx;
        _imageUrlxxxxxxController.text = _editedProduct.imageUrlxxxxxx;
        _imageUrlxxxxxxxController.text = _editedProduct.imageUrlxxxxxxx;
        _imageUrlxxxxxxxxController.text = _editedProduct.imageUrlxxxxxxxx;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _imageUrlxFocusNode.removeListener(_updateImageUrlx);
    _imageUrlxxFocusNode.removeListener(_updateImageUrlxx);
    _imageUrlxxxFocusNode.removeListener(_updateImageUrlxxx);
    _imageUrlxxxxFocusNode.removeListener(_updateImageUrlxxxx);
    _imageUrlxxxxxFocusNode.removeListener(_updateImageUrlxxxxx);
    _imageUrlxxxxxxFocusNode.removeListener(_updateImageUrlxxxxxx);
    _imageUrlxxxxxxxFocusNode.removeListener(_updateImageUrlxxxxxxx);
    _imageUrlxxxxxxxxFocusNode.removeListener(_updateImageUrlxxxxxxxx);

    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlxController.dispose();
    _imageUrlxxController.dispose();
    _imageUrlxxxController.dispose();
    _imageUrlxxxxController.dispose();
    _imageUrlxxxxxController.dispose();
    _imageUrlxxxxxxController.dispose();
    _imageUrlxxxxxxxController.dispose();
    _imageUrlxxxxxxxxController.dispose();

    _imageUrlFocusNode.dispose();
    _imageUrlxFocusNode.dispose();
    _imageUrlxxFocusNode.dispose();
    _imageUrlxxxFocusNode.dispose();
    _imageUrlxxxxFocusNode.dispose();
    _imageUrlxxxxxFocusNode.dispose();
    _imageUrlxxxxxxFocusNode.dispose();
    _imageUrlxxxxxxxFocusNode.dispose();
    _imageUrlxxxxxxxxFocusNode.dispose();

    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if ((!_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https')) ||
          (!_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.endsWith('.jpg') &&
              !_imageUrlController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  void _updateImageUrlx() {
    if (!_imageUrlxFocusNode.hasFocus) {
      if ((!_imageUrlxController.text.startsWith('http') &&
              !_imageUrlxController.text.startsWith('https')) ||
          (!_imageUrlxController.text.endsWith('.png') &&
              !_imageUrlxController.text.endsWith('.jpg') &&
              !_imageUrlxController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  void _updateImageUrlxx() {
    if (!_imageUrlxxFocusNode.hasFocus) {
      if ((!_imageUrlxxController.text.startsWith('http') &&
              !_imageUrlxxController.text.startsWith('https')) ||
          (!_imageUrlxxController.text.endsWith('.png') &&
              !_imageUrlxxController.text.endsWith('.jpg') &&
              !_imageUrlxxController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  void _updateImageUrlxxx() {
    if (!_imageUrlxxxFocusNode.hasFocus) {
      if ((!_imageUrlxxxController.text.startsWith('http') &&
              !_imageUrlxxxController.text.startsWith('https')) ||
          (!_imageUrlxxxController.text.endsWith('.png') &&
              !_imageUrlxxxController.text.endsWith('.jpg') &&
              !_imageUrlxxxController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  void _updateImageUrlxxxx() {
    if (!_imageUrlxxxxFocusNode.hasFocus) {
      if ((!_imageUrlxxxxController.text.startsWith('http') &&
              !_imageUrlxxxxController.text.startsWith('https')) ||
          (!_imageUrlxxxxController.text.endsWith('.png') &&
              !_imageUrlxxxxController.text.endsWith('.jpg') &&
              !_imageUrlxxxxController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  void _updateImageUrlxxxxx() {
    if (!_imageUrlxxxxxFocusNode.hasFocus) {
      if ((!_imageUrlxxxxxController.text.startsWith('http') &&
              !_imageUrlxxxxxController.text.startsWith('https')) ||
          (!_imageUrlxxxxxController.text.endsWith('.png') &&
              !_imageUrlxxxxxController.text.endsWith('.jpg') &&
              !_imageUrlxxxxxController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  void _updateImageUrlxxxxxx() {
    if (!_imageUrlxxxxxxFocusNode.hasFocus) {
      if ((!_imageUrlxxxxxxController.text.startsWith('http') &&
              !_imageUrlxxxxxxController.text.startsWith('https')) ||
          (!_imageUrlxxxxxxController.text.endsWith('.png') &&
              !_imageUrlxxxxxxController.text.endsWith('.jpg') &&
              !_imageUrlxxxxxxController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  void _updateImageUrlxxxxxxx() {
    if (!_imageUrlxxxxxxxFocusNode.hasFocus) {
      if ((!_imageUrlxxxxxxxController.text.startsWith('http') &&
              !_imageUrlxxxxxxxController.text.startsWith('https')) ||
          (!_imageUrlxxxxxxxController.text.endsWith('.png') &&
              !_imageUrlxxxxxxxController.text.endsWith('.jpg') &&
              !_imageUrlxxxxxxxController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  void _updateImageUrlxxxxxxxx() {
    if (!_imageUrlxxxxxxxxFocusNode.hasFocus) {
      if ((!_imageUrlxxxxxxxxController.text.startsWith('http') &&
              !_imageUrlxxxxxxxxController.text.startsWith('https')) ||
          (!_imageUrlxxxxxxxxController.text.endsWith('.png') &&
              !_imageUrlxxxxxxxxController.text.endsWith('.jpg') &&
              !_imageUrlxxxxxxxxController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    if (_editedProduct.id != null) {
      await Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
    } else {
      try {
        await Provider.of<Products>(context, listen: false)
            .addProduct(_editedProduct);
      } catch (error) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('An error occurred!'),
            content: Text('Something went wrong.'),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
      // finally {
      //   setState(() {
      //     _isLoading = false;
      //   });
      //   Navigator.of(context).pop();
      // }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      initialValue: _initValues['title'],
                      decoration: InputDecoration(labelText: 'Title'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_priceFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide a value.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                            title: value,
                            price: _editedProduct.price,
                            description: _editedProduct.description,
                            imageUrl: _editedProduct.imageUrl,
                            imageUrlx: _editedProduct.imageUrlx,
                            imageUrlxx: _editedProduct.imageUrlxx,
                            imageUrlxxx: _editedProduct.imageUrlxxx,
                            imageUrlxxxx: _editedProduct.imageUrlxxxx,
                            imageUrlxxxxx: _editedProduct.imageUrlxxxxx,
                            imageUrlxxxxxx: _editedProduct.imageUrlxxxxxx,
                            imageUrlxxxxxxx: _editedProduct.imageUrlxxxxxxx,
                            imageUrlxxxxxxxx: _editedProduct.imageUrlxxxxxxxx,
                            id: _editedProduct.id,
                            isFavorite: _editedProduct.isFavorite);
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['price'],
                      decoration: InputDecoration(labelText: 'Price'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      focusNode: _priceFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_descriptionFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a price.';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number.';
                        }
                        if (double.parse(value) <= 0) {
                          return 'Please enter a number greater than zero.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                            title: _editedProduct.title,
                            price: double.parse(value),
                            description: _editedProduct.description,
                            imageUrl: _editedProduct.imageUrl,
                            imageUrlx: _editedProduct.imageUrlx,
                            imageUrlxx: _editedProduct.imageUrlxx,
                            imageUrlxxx: _editedProduct.imageUrlxxx,
                            imageUrlxxxx: _editedProduct.imageUrlxxxx,
                            imageUrlxxxxx: _editedProduct.imageUrlxxxxx,
                            imageUrlxxxxxx: _editedProduct.imageUrlxxxxxx,
                            imageUrlxxxxxxx: _editedProduct.imageUrlxxxxxxx,
                            imageUrlxxxxxxxx: _editedProduct.imageUrlxxxxxxxx,
                            id: _editedProduct.id,
                            isFavorite: _editedProduct.isFavorite);
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['description'],
                      decoration: InputDecoration(labelText: 'Description'),
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      focusNode: _descriptionFocusNode,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a description.';
                        }
                        if (value.length < 10) {
                          return 'Should be at least 10 characters long.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                          title: _editedProduct.title,
                          price: _editedProduct.price,
                          description: value,
                          imageUrl: _editedProduct.imageUrl,
                          imageUrlx: _editedProduct.imageUrlx,
                          imageUrlxx: _editedProduct.imageUrlxx,
                          imageUrlxxx: _editedProduct.imageUrlxxx,
                          imageUrlxxxx: _editedProduct.imageUrlxxxx,
                          imageUrlxxxxx: _editedProduct.imageUrlxxxxx,
                          imageUrlxxxxxx: _editedProduct.imageUrlxxxxxx,
                          imageUrlxxxxxxx: _editedProduct.imageUrlxxxxxxx,
                          imageUrlxxxxxxxx: _editedProduct.imageUrlxxxxxxxx,
                          id: _editedProduct.id,
                          isFavorite: _editedProduct.isFavorite,
                        );
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(
                            top: 8,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: _imageUrlController.text.isEmpty
                              ? Text('Enter a URL')
                              : FittedBox(
                                  child: Image.network(
                                    _imageUrlController.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Image URL'),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageUrlController,
                            focusNode: _imageUrlFocusNode,
                            //           onFieldSubmitted: (_) {
                            //           _saveForm();
                            //       },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter an image URL.';
                              }
                              if (!value.startsWith('http') &&
                                  !value.startsWith('https')) {
                                return 'Please enter a valid URL.';
                              }
                              if (!value.endsWith('.png') &&
                                  !value.endsWith('.jpg') &&
                                  !value.endsWith('.jpeg')) {
                                return 'Please enter a valid image URL.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedProduct = Product(
                                title: _editedProduct.title,
                                price: _editedProduct.price,
                                description: _editedProduct.description,
                                imageUrl: value,
                                imageUrlx: _editedProduct.imageUrlx,
                                imageUrlxx: _editedProduct.imageUrlxx,
                                imageUrlxxx: _editedProduct.imageUrlxxx,
                                imageUrlxxxx: _editedProduct.imageUrlxxxx,
                                imageUrlxxxxx: _editedProduct.imageUrlxxxxx,
                                imageUrlxxxxxx: _editedProduct.imageUrlxxxxxx,
                                imageUrlxxxxxxx: _editedProduct.imageUrlxxxxxxx,
                                imageUrlxxxxxxxx:
                                    _editedProduct.imageUrlxxxxxxxx,
                                id: _editedProduct.id,
                                isFavorite: _editedProduct.isFavorite,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(
                            top: 8,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: _imageUrlxController.text.isEmpty
                              ? Text('Enter a URL')
                              : FittedBox(
                                  child: Image.network(
                                    _imageUrlxController.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Image URL'),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageUrlxController,
                            focusNode: _imageUrlxFocusNode,
                            //               onFieldSubmitted: (_) {
                            //               _saveForm();
                            //           },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter an image URL.';
                              }
                              if (!value.startsWith('http') &&
                                  !value.startsWith('https')) {
                                return 'Please enter a valid URL.';
                              }
                              if (!value.endsWith('.png') &&
                                  !value.endsWith('.jpg') &&
                                  !value.endsWith('.jpeg')) {
                                return 'Please enter a valid image URL.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedProduct = Product(
                                title: _editedProduct.title,
                                price: _editedProduct.price,
                                description: _editedProduct.description,
                                imageUrl: _editedProduct.imageUrl,
                                imageUrlx: value,
                                imageUrlxx: _editedProduct.imageUrlxx,
                                imageUrlxxx: _editedProduct.imageUrlxxx,
                                imageUrlxxxx: _editedProduct.imageUrlxxxx,
                                imageUrlxxxxx: _editedProduct.imageUrlxxxxx,
                                imageUrlxxxxxx: _editedProduct.imageUrlxxxxxx,
                                imageUrlxxxxxxx: _editedProduct.imageUrlxxxxxxx,
                                imageUrlxxxxxxxx:
                                    _editedProduct.imageUrlxxxxxxxx,
                                id: _editedProduct.id,
                                isFavorite: _editedProduct.isFavorite,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(
                            top: 8,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: _imageUrlxxController.text.isEmpty
                              ? Text('Enter a URL')
                              : FittedBox(
                                  child: Image.network(
                                    _imageUrlxxController.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Image URL'),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageUrlxxController,
                            focusNode: _imageUrlxxFocusNode,
                            //                onFieldSubmitted: (_) {
                            //                _saveForm();
                            //            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter an image URL.';
                              }
                              if (!value.startsWith('http') &&
                                  !value.startsWith('https')) {
                                return 'Please enter a valid URL.';
                              }
                              if (!value.endsWith('.png') &&
                                  !value.endsWith('.jpg') &&
                                  !value.endsWith('.jpeg')) {
                                return 'Please enter a valid image URL.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedProduct = Product(
                                title: _editedProduct.title,
                                price: _editedProduct.price,
                                description: _editedProduct.description,
                                imageUrl: _editedProduct.imageUrl,
                                imageUrlx: _editedProduct.imageUrlx,
                                imageUrlxx: value,
                                imageUrlxxx: _editedProduct.imageUrlxxx,
                                imageUrlxxxx: _editedProduct.imageUrlxxxx,
                                imageUrlxxxxx: _editedProduct.imageUrlxxxxx,
                                imageUrlxxxxxx: _editedProduct.imageUrlxxxxxx,
                                imageUrlxxxxxxx: _editedProduct.imageUrlxxxxxxx,
                                imageUrlxxxxxxxx:
                                    _editedProduct.imageUrlxxxxxxxx,
                                id: _editedProduct.id,
                                isFavorite: _editedProduct.isFavorite,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(
                            top: 8,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: _imageUrlxxxController.text.isEmpty
                              ? Text('Enter a URL')
                              : FittedBox(
                                  child: Image.network(
                                    _imageUrlxxxController.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Image URL'),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageUrlxxxController,
                            focusNode: _imageUrlxxxFocusNode,
                            //                     onFieldSubmitted: (_) {
                            //                     _saveForm();
                            //                 },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter an image URL.';
                              }
                              if (!value.startsWith('http') &&
                                  !value.startsWith('https')) {
                                return 'Please enter a valid URL.';
                              }
                              if (!value.endsWith('.png') &&
                                  !value.endsWith('.jpg') &&
                                  !value.endsWith('.jpeg')) {
                                return 'Please enter a valid image URL.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedProduct = Product(
                                title: _editedProduct.title,
                                price: _editedProduct.price,
                                description: _editedProduct.description,
                                imageUrl: _editedProduct.imageUrl,
                                imageUrlx: _editedProduct.imageUrlx,
                                imageUrlxx: _editedProduct.imageUrlxx,
                                imageUrlxxx: value,
                                imageUrlxxxx: _editedProduct.imageUrlxxxx,
                                imageUrlxxxxx: _editedProduct.imageUrlxxxxx,
                                imageUrlxxxxxx: _editedProduct.imageUrlxxxxxx,
                                imageUrlxxxxxxx: _editedProduct.imageUrlxxxxxxx,
                                imageUrlxxxxxxxx:
                                    _editedProduct.imageUrlxxxxxxxx,
                                id: _editedProduct.id,
                                isFavorite: _editedProduct.isFavorite,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(
                            top: 8,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: _imageUrlxxxxController.text.isEmpty
                              ? Text('Enter a URL')
                              : FittedBox(
                                  child: Image.network(
                                    _imageUrlxxxxController.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Image URL'),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageUrlxxxxController,
                            focusNode: _imageUrlxxxxFocusNode,
                            //                    onFieldSubmitted: (_) {
                            //                    _saveForm();
                            //                },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter an image URL.';
                              }
                              if (!value.startsWith('http') &&
                                  !value.startsWith('https')) {
                                return 'Please enter a valid URL.';
                              }
                              if (!value.endsWith('.png') &&
                                  !value.endsWith('.jpg') &&
                                  !value.endsWith('.jpeg')) {
                                return 'Please enter a valid image URL.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedProduct = Product(
                                title: _editedProduct.title,
                                price: _editedProduct.price,
                                description: _editedProduct.description,
                                imageUrl: _editedProduct.imageUrl,
                                imageUrlx: _editedProduct.imageUrlx,
                                imageUrlxx: _editedProduct.imageUrlxx,
                                imageUrlxxx: _editedProduct.imageUrlxxx,
                                imageUrlxxxx: value,
                                imageUrlxxxxx: _editedProduct.imageUrlxxxxx,
                                imageUrlxxxxxx: _editedProduct.imageUrlxxxxxx,
                                imageUrlxxxxxxx: _editedProduct.imageUrlxxxxxxx,
                                imageUrlxxxxxxxx:
                                    _editedProduct.imageUrlxxxxxxxx,
                                id: _editedProduct.id,
                                isFavorite: _editedProduct.isFavorite,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(
                            top: 8,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: _imageUrlxxxxxController.text.isEmpty
                              ? Text('Enter a URL')
                              : FittedBox(
                                  child: Image.network(
                                    _imageUrlxxxxxController.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Image URL'),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageUrlxxxxxController,
                            focusNode: _imageUrlxxxxxFocusNode,
//                            onFieldSubmitted: (_) {
                            //                            _saveForm();
                            //                        },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter an image URL.';
                              }
                              if (!value.startsWith('http') &&
                                  !value.startsWith('https')) {
                                return 'Please enter a valid URL.';
                              }
                              if (!value.endsWith('.png') &&
                                  !value.endsWith('.jpg') &&
                                  !value.endsWith('.jpeg')) {
                                return 'Please enter a valid image URL.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedProduct = Product(
                                title: _editedProduct.title,
                                price: _editedProduct.price,
                                description: _editedProduct.description,
                                imageUrl: _editedProduct.imageUrl,
                                imageUrlx: _editedProduct.imageUrlx,
                                imageUrlxx: _editedProduct.imageUrlxx,
                                imageUrlxxx: _editedProduct.imageUrlxxx,
                                imageUrlxxxx: _editedProduct.imageUrlxxxx,
                                imageUrlxxxxx: value,
                                imageUrlxxxxxx: _editedProduct.imageUrlxxxxxx,
                                imageUrlxxxxxxx: _editedProduct.imageUrlxxxxxxx,
                                imageUrlxxxxxxxx:
                                    _editedProduct.imageUrlxxxxxxxx,
                                id: _editedProduct.id,
                                isFavorite: _editedProduct.isFavorite,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(
                            top: 8,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: _imageUrlxxxxxxController.text.isEmpty
                              ? Text('Enter a URL')
                              : FittedBox(
                                  child: Image.network(
                                    _imageUrlxxxxxxController.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Image URL'),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageUrlxxxxxxController,
                            focusNode: _imageUrlxxxxxxFocusNode,
                            //                      onFieldSubmitted: (_) {
                            //                      _saveForm();
                            //                  },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter an image URL.';
                              }
                              if (!value.startsWith('http') &&
                                  !value.startsWith('https')) {
                                return 'Please enter a valid URL.';
                              }
                              if (!value.endsWith('.png') &&
                                  !value.endsWith('.jpg') &&
                                  !value.endsWith('.jpeg')) {
                                return 'Please enter a valid image URL.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedProduct = Product(
                                title: _editedProduct.title,
                                price: _editedProduct.price,
                                description: _editedProduct.description,
                                imageUrl: _editedProduct.imageUrl,
                                imageUrlx: _editedProduct.imageUrlx,
                                imageUrlxx: _editedProduct.imageUrlxx,
                                imageUrlxxx: _editedProduct.imageUrlxxx,
                                imageUrlxxxx: _editedProduct.imageUrlxxxx,
                                imageUrlxxxxx: _editedProduct.imageUrlxxxxx,
                                imageUrlxxxxxx: value,
                                imageUrlxxxxxxx: _editedProduct.imageUrlxxxxxxx,
                                imageUrlxxxxxxxx:
                                    _editedProduct.imageUrlxxxxxxxx,
                                id: _editedProduct.id,
                                isFavorite: _editedProduct.isFavorite,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(
                            top: 8,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: _imageUrlxxxxxxxController.text.isEmpty
                              ? Text('Enter a URL')
                              : FittedBox(
                                  child: Image.network(
                                    _imageUrlxxxxxxxController.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Image URL'),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageUrlxxxxxxxController,
                            focusNode: _imageUrlxxxxxxxFocusNode,
                            //                    onFieldSubmitted: (_) {
                            //                    _saveForm();
                            //                },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter an image URL.';
                              }
                              if (!value.startsWith('http') &&
                                  !value.startsWith('https')) {
                                return 'Please enter a valid URL.';
                              }
                              if (!value.endsWith('.png') &&
                                  !value.endsWith('.jpg') &&
                                  !value.endsWith('.jpeg')) {
                                return 'Please enter a valid image URL.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedProduct = Product(
                                title: _editedProduct.title,
                                price: _editedProduct.price,
                                description: _editedProduct.description,
                                imageUrl: _editedProduct.imageUrl,
                                imageUrlx: _editedProduct.imageUrlx,
                                imageUrlxx: _editedProduct.imageUrlxx,
                                imageUrlxxx: _editedProduct.imageUrlxxx,
                                imageUrlxxxx: _editedProduct.imageUrlxxxx,
                                imageUrlxxxxx: _editedProduct.imageUrlxxxxx,
                                imageUrlxxxxxx: _editedProduct.imageUrlxxxxxx,
                                imageUrlxxxxxxx: value,
                                imageUrlxxxxxxxx:
                                    _editedProduct.imageUrlxxxxxxxx,
                                id: _editedProduct.id,
                                isFavorite: _editedProduct.isFavorite,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(
                            top: 8,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: _imageUrlxxxxxxxxController.text.isEmpty
                              ? Text('Enter a URL')
                              : FittedBox(
                                  child: Image.network(
                                    _imageUrlxxxxxxxxController.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Image URL'),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageUrlxxxxxxxxController,
                            focusNode: _imageUrlxxxxxxxxFocusNode,
                            onFieldSubmitted: (_) {
                              _saveForm();
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter an image URL.';
                              }
                              if (!value.startsWith('http') &&
                                  !value.startsWith('https')) {
                                return 'Please enter a valid URL.';
                              }
                              if (!value.endsWith('.png') &&
                                  !value.endsWith('.jpg') &&
                                  !value.endsWith('.jpeg')) {
                                return 'Please enter a valid image URL.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedProduct = Product(
                                title: _editedProduct.title,
                                price: _editedProduct.price,
                                description: _editedProduct.description,
                                imageUrl: _editedProduct.imageUrl,
                                imageUrlx: _editedProduct.imageUrlx,
                                imageUrlxx: _editedProduct.imageUrlxx,
                                imageUrlxxx: _editedProduct.imageUrlxxx,
                                imageUrlxxxx: _editedProduct.imageUrlxxxx,
                                imageUrlxxxxx: _editedProduct.imageUrlxxxxx,
                                imageUrlxxxxxx: _editedProduct.imageUrlxxxxxx,
                                imageUrlxxxxxxx: _editedProduct.imageUrlxxxxxxx,
                                imageUrlxxxxxxxx: value,
                                id: _editedProduct.id,
                                isFavorite: _editedProduct.isFavorite,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
