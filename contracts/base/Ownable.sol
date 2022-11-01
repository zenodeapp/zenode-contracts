// SPDX-License-Identifier: MIT
// Created by ZENODE (zenodeapp - https://github.com/zenodeapp/)

/**********************************************************************************
* MIT License                                                                     *
* Copyright (c) 2022 ZENODE                                                       *
*                                                                                 *
* Permission is hereby granted, free of charge, to any person obtaining a copy    *
* of this software and associated documentation files (the "Software"), to deal   *
* in the Software without restriction, including without limitation the rights    *
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell       *
* copies of the Software, and to permit persons to whom the Software is           *
* furnished to do so, subject to the following conditions:                        *
*                                                                                 *
* The above copyright notice and this permission notice shall be included in all  *
* copies or substantial portions of the Software.                                 *
*                                                                                 *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR      *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,        *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE     *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER          *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,   *
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE   *
* SOFTWARE.                                                                       *
**********************************************************************************/

pragma solidity ^0.8.17;

contract Ownable {
  address private _owner;
  address[] private _admins;

  struct Admin {
    bool isAdmin;
    uint index;
  }

  mapping(address => Admin) private __admins;

  constructor() {
    _owner = msg.sender;
  }

  modifier onlyOwner {
    require(_isOwner(msg.sender), "Only the owner is allowed to do this.");
    _;
  }

  modifier onlyAdmin {
    require(_isOwner(msg.sender) || _isAdmin(msg.sender), 
    "Only the owner or admins are allowed to do this.");
    _;
  }

  modifier onlyBy(address _address) {
    require(msg.sender == _address, "Sender not authorized.");
    _;
  }

  function _isOwner(address _address) public view returns(bool) {
    return _address == _owner;
  }

  function _isAdmin(address _address) public view returns(bool) {
    return __admins[_address].isAdmin;
  }

  function _changeOwner(address _newOwner) public onlyOwner {
    _owner = _newOwner;
  }

  function _addAdmin(address _address) public onlyOwner {
    require(!_isOwner(_address), "The owner can't be added as an admin.");
    require(!_isAdmin(_address), "The address you specified is already registered as an admin.");

    _admins.push(_address);
    __admins[_address].isAdmin = true;
    __admins[_address].index = _admins.length - 1;
  }

  function _removeAdmin(address _address) public onlyOwner {
    require(_isAdmin(_address), "The address you specified is not registered as an admin.");

    uint index = __admins[_address].index;
    address last = _admins[_admins.length - 1];

    // In the _admins-array we replace the address we're removing as an admin with the last address
    _admins[index] = last;
    __admins[last].index = index;

    // Shorten the _admins-array
    _admins.pop();

    // Remove the admin in the __admins-mapping.
    __admins[_address].isAdmin = false;
    __admins[_address].index = 0;
  }

  function _getOwner() public view returns(address) {
    return _owner;
  }

  function _getAdmins() public view returns(address[] memory) {
    return _admins;
  }
} 