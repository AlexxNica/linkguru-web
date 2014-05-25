# @cjsx React.DOM

jest.dontMock '../src/javascript/checkboxWithLabel.cjsx'

describe 'CheckboxWithLabel', ->
  it 'changes the text after click', ->
    React = require 'react/addons'
    CheckboxWithLabel = require '../src/javascript/checkboxWithLabel.cjsx'
    TestUtils = React.addons.TestUtils

    # Render a checkbox with label in the document
    checkbox = <CheckboxWithLabel labelOn="On" labelOff="Off" />
    TestUtils.renderIntoDocument(checkbox)

    # Verify that it's Off by default
    label = TestUtils.findRenderedDOMComponentWithTag(checkbox, 'label')
    expect(label.getDOMNode().textContent).toEqual('Off')

    # Simulate a click and verify that it is now On
    input = TestUtils.findRenderedDOMComponentWithTag(checkbox, 'input')
    TestUtils.Simulate.change(input)
    expect(label.getDOMNode().textContent).toEqual('On')
