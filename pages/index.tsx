import Head from 'next/head';
import Link from 'next/link'

type foo = number | string;

const title: foo = "Title";

export default () => 
    <div>
        <Head>
            <title>{ title }</title>
            <meta name="viewport" content="initial-scale=1.0, width=device-width" />
        </Head>
        DEMO DEMO DEMO!
        <p>Hello!</p>
        <img src="/static/kitten.jpg" alt="my image" />
        <p>
            Go to <Link prefetch href={{ pathname: '/about', query: { name: 'Peter' } }}>
                <a>About</a>
            </Link>{' '}
        </p>
        <style>{`
        p {
            color: green;
            background: white;
        }
        div {
            background: red;
        }
        @media (max-width: 600px) {
        div {
            background: blue;
        }
        }
        `}</style>
        <style>{`
        body {
            background: black;
        }
        `}</style>
    </div>;