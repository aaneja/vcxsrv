/*  This file is part of mhmake.
 *
 *  Copyright (C) 2001-2009 Marc Haesen
 *
 *  Mhmake is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  Mhmake is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Mhmake.  If not, see <http://www.gnu.org/licenses/>.
*/

/* $Rev$ */

#ifndef __CURDIR_H
#define __CURDIR_H

#include "refptr.h"
class fileinfo;

class curdir
{
public:
  class initcurdir : public refptr<fileinfo>
  {
  public:
    initcurdir &operator=(const refptr<fileinfo>& Src);

    initcurdir();
  };
private:
  static initcurdir m_pCurrentDir;

public:
  static refptr<fileinfo> &GetCurDir()
  {
    return m_pCurrentDir;
  }
};

#endif

