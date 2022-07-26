// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React, { useState, useEffect } from 'react';
import YouTube from 'react-youtube';
import { Container } from 'react-bootstrap';
import axios from 'axios';
import Control from './Control.js';
import 'bootstrap/dist/css/bootstrap.min.css';

function Product ({ productUrl, editUrl }) {
  const [player, setPlayer] = useState(null);
  const [loading, setLoading] = useState(false);
  const [showOverlay, setShowOverlay] = useState(false);
  const [product, setProduct] = useState({});
  const [error, setError] = useState({});

  const showPopup = () => {
    const { time_to_showup, active } = product.control;
    setShowOverlay(false);

    if (!player && !active) { return };
    const interval = setInterval(() => {
      const currentTime = player.getCurrentTime();
      if (currentTime > time_to_showup && active) {
        setShowOverlay(true)
        clearInterval(interval);
      }
    }, 1000);
  };
 
  useEffect(() => { 
    setLoading(true);

    axios
      .get(productUrl)
      .then(resp => setProduct(resp.data))
      .catch(resp => setError(resp))
      .finally(() => setLoading(false))
    
  }, [productUrl]);

  if (loading) return <h2>LOADING...</h2>
  return(
    <Container>
      <YouTube
        title={product?.title}
        videoId={product?.youtube_id}
        opts={{height: 780, width: 1280}}
        onReady={ e => setPlayer(e.target) }
        onPlay={showPopup}
      />
      { showOverlay &&
        <Control
          player={player}
          showOverlay={showOverlay}
          control={product?.control}
        />
      }
      <a href={editUrl} className='btn btn-primary'>Edit Video Details</a>
    </Container>
  )
}

export default Product;

