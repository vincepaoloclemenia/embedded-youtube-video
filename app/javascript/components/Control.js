import { useEffect } from "react";

import React from 'react';

function Control ({ control }) {

  return(
    <button
      style={{
        height: 300,
        width: 300,
        position: 'relative',
        float: 'right',
        right: '450px',
        bottom: '560px',
        transition: '0.5s',
        borderRadius: '50%'
      }}>
      <img src={control.avatar.url} />
      {control?.name}
    </button>
  )
}

export default Control;