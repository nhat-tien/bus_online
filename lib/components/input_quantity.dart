import 'package:flutter/material.dart';

class InputQuantity extends StatelessWidget {
	final Function onTapRightChild;
	final Function onTapLeftChild;
	final Widget? rightChild;
	final Widget middleChild;
	final Widget? leftChild;
  const InputQuantity ({super.key, required this.middleChild, this.leftChild, this.rightChild, required this.onTapRightChild, required this.onTapLeftChild});

  @override
  Widget build(BuildContext context) {
    return Row(
    	children: [
    		GestureDetector(
    			onTap: () {
    				onTapRightChild;
    			},
    			child: rightChild,
    		),
    		middleChild,
    		GestureDetector(
    			onTap: () {
    				onTapRightChild;
    			},
    			child: rightChild,
    		),
    	],
    )
		;
  }
}
