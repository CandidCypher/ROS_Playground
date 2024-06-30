// Auto-generated. Do not edit!

// (in-package my_robot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class HardwareStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.temperature = null;
      this.are_motors_up = null;
      this.debug_msg = null;
    }
    else {
      if (initObj.hasOwnProperty('temperature')) {
        this.temperature = initObj.temperature
      }
      else {
        this.temperature = 0;
      }
      if (initObj.hasOwnProperty('are_motors_up')) {
        this.are_motors_up = initObj.are_motors_up
      }
      else {
        this.are_motors_up = false;
      }
      if (initObj.hasOwnProperty('debug_msg')) {
        this.debug_msg = initObj.debug_msg
      }
      else {
        this.debug_msg = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type HardwareStatus
    // Serialize message field [temperature]
    bufferOffset = _serializer.int64(obj.temperature, buffer, bufferOffset);
    // Serialize message field [are_motors_up]
    bufferOffset = _serializer.bool(obj.are_motors_up, buffer, bufferOffset);
    // Serialize message field [debug_msg]
    bufferOffset = _serializer.string(obj.debug_msg, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type HardwareStatus
    let len;
    let data = new HardwareStatus(null);
    // Deserialize message field [temperature]
    data.temperature = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [are_motors_up]
    data.are_motors_up = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [debug_msg]
    data.debug_msg = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.debug_msg);
    return length + 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'my_robot_msgs/HardwareStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '16c9db7011617520b4a5c142182c234c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 temperature
    bool are_motors_up
    string debug_msg
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new HardwareStatus(null);
    if (msg.temperature !== undefined) {
      resolved.temperature = msg.temperature;
    }
    else {
      resolved.temperature = 0
    }

    if (msg.are_motors_up !== undefined) {
      resolved.are_motors_up = msg.are_motors_up;
    }
    else {
      resolved.are_motors_up = false
    }

    if (msg.debug_msg !== undefined) {
      resolved.debug_msg = msg.debug_msg;
    }
    else {
      resolved.debug_msg = ''
    }

    return resolved;
    }
};

module.exports = HardwareStatus;
