# UIView-Anchors
A Swift extension for those who like using layout anchors &amp;&amp; need to support pre-iOS 9

## Layout Anchors

We used to do this:

```
self.view.addConstraint(
            NSLayoutConstraint(
                item: view1, attribute: .Right, relatedBy: .Equal, toItem: view2, attribute: .Left, multiplier: 1, constant: 0
            )
        )
```

Now, we can achieve the same using layout anchors:

```
view1.rightAnchor.constraintEqualToAnchor(view2.leftAnchor).active = true
```

Sadly, anchors are not supported on pre-iOS 9 devices, so I created this extension to mirror anchors. Using this extension, we write the equivalent like this:

```
view1.pRight.eq(view2.pLeft).active = true
```

As you can see, I have taken one step further to shorten the form. 

`.eq`, `.ge`, and `.le` stands for equals, greater than or equals, and less than or equals respectively. 

All available layout properties are prefixed with p. For example, `pRight` stands for property right.

The following properties are available:

- pLeft
- pRight
- pTop
- pBottom
- pTrailing
- pLeading
- pCenterX
- pCenterY
- pWidth
- pHeight

Feel free to add your own.

## Layout Guides

Like layout anchors, layout guides are a great addition which is also available only on iOS 9 and above.

Normally, we would create a layout guide like this: 

```
let guide = UILayoutGuide()
self.addLayoutGuide(guide)
return guide
```

Using this extension, we do the following:

```
let guide = view.addSupportedLayoutGuide()
```
`addSupportedLayoutGuide()` is an added method on UIView which returns an instance conforming to `LayoutSupport` protocol. The `LayoutSupport` protocol exposes the `pHeight`,`pLeft`, etc properties

For iOS 9 and above, a UILayoutGuide is returned.
For pre-iOS 9, a dummy UIView is returned.

If you use `addSupportedLayoutGuide` to create layout guides, returned instances conform to `LayoutSupport` and you can only use only `p` properties to set up layout constraints.

